class DigitalCvsController < ApplicationController
  before_action :set_digital_cv, except: [:index, :new, :create, :online_resume]
  before_action :authenticate_user!, only: [:share_and_download]

  respond_to :docx

  # GET /digital_cvs
  def index
    unless user_signed_in?
      @digital_cvs = DigitalCv.where(id: cookies[:digital_cv])
    else
      @digital_cvs = DigitalCv.where(user_id: current_user.id)
    end

    if @digital_cvs.size == 0
      redirect_to new_digital_cv_path
    end
  end

  # GET /digital_cvs/1
  def show
  end

  # GET /digital_cvs/new
  def new
    @digital_cv = DigitalCv.new
  end

  # GET /digital_cvs/1/edit
  def edit
  end

  # POST /digital_cvs
  def create
    @digital_cv = DigitalCv.new(digital_cv_params)

    if @digital_cv.save(validate: false)
      cookies[:digital_cv] = { :value => @digital_cv.id, :expires => 1.month.from_now }
      redirect_to edit_digital_cv_url(@digital_cv)
    else
      render :new
    end
  end

  # PATCH/PUT /digital_cvs/1
  def update
    @digital_cv.update(digital_cv_params)
    render :update, locals: { only_name: false, only_photo: false, errors: @digital_cv.errors.any? }
  end

  # DELETE /digital_cvs/1
  def destroy
    @digital_cv.destroy
    redirect_to digital_cvs_url, notice: 'Digital cv was successfully deleted.'
  end

  def save_personal_detail
    @personal_detail = @digital_cv.personal_detail
    @personal_detail.update_attributes(personal_detail_params)
    render :update, locals: { only_name: false, only_photo: false, errors: @personal_detail.errors.any? }
  end

  def save_contact_detail
    if @digital_cv.contact_detail
      @contact_detail = @digital_cv.contact_detail
      @contact_detail.update_attributes(contact_detail_params)
    else
      @contact_detail = @digital_cv.build_contact_detail(contact_detail_params)
      @contact_detail.save
    end

    render :update, locals: { only_name: false, only_photo: false, errors: @contact_detail.errors.any? }
  end

  def update_name
    @digital_cv.update_column(:name, params[:digital_cv][:name])
    render :update, locals: { only_name: true, only_photo: false }
  end

  def update_name
    @digital_cv.update_column(:name, params[:digital_cv][:name])
    render :update, locals: { only_name: true, only_photo: false }
  end

  def save_photo
    photo = @digital_cv.photo

    photo.update(photo_params)
    render :update, locals: { only_name: false, only_photo: true, errors: photo.errors.any? }
  end

  def change_cv_template
    @digital_cv.update_attribute(:template_id, params[:template_id])
  end

  def share_and_download
    if current_user.present?
      analytic_record = [viewed: true ,ip_address: request.remote_ip, user_id: current_user.id,type_id: @digital_cv.id]
      AnalyticDigitalCv.create(analytic_record)
      #logger.debug"----ccccccccccccccc---#{@digital_cv.inspect}" 
    else
      analytic_record = [viewed: true ,ip_address: request.remote_ip, type_id: @digital_cv.id]
      AnalyticDigitalCv.create(analytic_record)
    end  
    unless @digital_cv.user_id
      @digital_cv.user_id = current_user.id
      @digital_cv.save(validate: false) 
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@digital_cv.name}",
        show_as_html: params.key?('debug'),
        encoding:     'utf8',
        margin: {left: 0, top: 0, right:0 }
       AnalyticDigitalCv.update(downloaded: true)
      end
    end
  end

  def online_resume
    @digital_cv = DigitalCv.find_by(slug: params[:slug])
    raise ActiveRecord::RecordNotFound unless @digital_cv

    # cookies[:ecv] ||= { :value => { digital_cv_id: @digital_cv.id, downloaded: false, viewed: false }, :expires => 3.month.from_now }

    if request.format == 'html'
      #@digital_cv.increment(:view)
      analytic_record = [viewed: true ,ip_address: request.ip, user_id: current_user.id,type_id: @digital_cv.id]
      AnalyticDigitalCv.create(analytic_record) 
      # cookies[:ecv][:viewed] = true
    end

    if request.format == 'pdf'
      #@digital_cv.increment(:download)
      AnalyticDigitalCv.update(downloaded: true)
      # cookies[:ecv]['downloaded'] = 'true'
    end

    respond_to do |format|
      format.html { render :share_and_download }
      format.pdf do
        render pdf: "#{@digital_cv.name}",
        template: 'digital_cvs/share_and_download',
        show_as_html: params.key?('debug'),
        margin: {left: 0, top: 0, right:0 }
      end
    end
  end

  def download_cv_docx
    respond_to do |format|
      format.docx { headers["Content-Disposition"] = "attachment; filename=\"#{@digital_cv.name}"+".docx\"" }
    end
    render partial: "digital_cvs/templates/docx/#{@digital_cv.template.name}" + ".docx.caracal"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_digital_cv
    @digital_cv = DigitalCv.find(params[:id])
    cv = cookies[:digital_cv]
    raise Pundit::NotAuthorizedError unless DigitalCvPolicy.new(current_user, @digital_cv, cv).send("#{action_name}?")
  end


  # Only allow a trusted parameter "white list" through.
  def digital_cv_params
    params.require(:digital_cv).permit(
      :summary, :id, :name, :user_id, :objective, :is_experienced, :employment_status, :template_id, :template, :slug,
      employment_details_attributes: employment_details_attributes,
      academic_details_attributes: academic_details_attributes,
      cv_languages_attributes: cv_languages_attributes,
      research_or_project_details_attributes: [ :id, :title, :description, :duration, :guide,:_destroy],
      trainings_attributes: [ :id, :name, :info, :duration, :institute, :_destroy],
      honor_and_awards_attributes: [ :id, :award_date, :company_name, :title, :awarded_by, :_destroy],
      references_attributes: [ :id, :name, :job_title_id, :company_name, :email, :mobile, :_destroy],
      cv_skills_attributes: [:id, :skill, :skill_id, :self_rating, :_destroy],
      certifications_attributes: [:id, :date, :title, :certifier, :_destroy],
     )
  end

  def employment_details_attributes
    [
      :id, :job_title_id, :company_id, :achievement, :responsibilities,
      :start_date, :end_date, :present_job, :industry_name, :_destroy,
      company_attributes: [:website, :name, :id]
    ]
  end

  def academic_details_attributes
    [
      :institution, :id, :degree_id, :specialization_id, :is_cgpa,
      :institute, :university, :percentage, :start_date, :end_date, :_destroy, :pursuing
    ]
  end

  def contact_detail_params
    params.require(:contact_detail).permit(:id, :first_name, :last_name, :email,
      :mobile, :address, :pincode, :skype_username, :linkedin_url, :digital_cv_id )
  end

  def cv_languages_attributes
    [ :id, :language_id, :read, :write, :speak, :_destroy ]
  end

  def personal_detail_params
    params.require(:personal_detail).permit(:id,
      :gender, :total_experience, :date_of_birth, :marital_status, :nationality,
      :disabled, :hobbies, :affiliations, :digital_cv_id
    )
  end

  def photo_params
    params.require(:photo).permit(:id, :image_type, :image)
  end
end
