class DigitalCvsController < ApplicationController
  before_action :set_digital_cv, except: [:index, :new, :create, :share_and_download]
  before_action :authenticate_user!, only: [:index, :share_and_download]

  # layout 'pdf', only: [:share_and_download]
  respond_to :docx

  # GET /digital_cvs
  def index
    @digital_cvs = DigitalCv.where(user_id: current_user.id)
    if @digital_cvs.size == 0
      redirect_to new_digital_cv_path
    end
  end

  # GET /digital_cvs/1
  def show
  end

  # GET /digital_cvs/new
  def new
    @digital_cv = DigitalCv.new(template_id: params[:template_id])
  end

  # GET /digital_cvs/1/edit
  def edit
  end

  # POST /digital_cvs
  def create
    @digital_cv = DigitalCv.new(digital_cv_params)

    if @digital_cv.save(validate: false)
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

  def save_photo
    photo = @digital_cv.photo

    photo.update(photo_params)
    render :update, locals: { only_name: false, only_photo: true, errors: photo.errors.any? }
  end

  def change_cv_template
    @digital_cv.update_attribute(:template_id, params[:template_id])
    redirect_to request.referer
  end

  def share_and_download
    begin
      conditions = {id: params[:id]}
      conditions.merge!({slug: params[:slug]}) if params[:slug].present?

      @digital_cv = DigitalCv.find_by! conditions
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_url, alert: "Sorry, no matching URL found!!"
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@digital_cv.name}",
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
  end


  # Only allow a trusted parameter "white list" through.
  def digital_cv_params
    params.require(:digital_cv).permit(
      :prefferred_location, :prefferred_country, :prefferred_state, :prefferred_city,
      :current_location, :current_country, :current_state, :current_city, :summary,
      :year, :month, :id, :name, :user_id, :objective, :is_experienced, :total_experience,
      :employment_status, :template_id, :template, employment_details_attributes: employment_details_attributes,
      academic_details_attributes: academic_details_attributes, cv_languages_attributes: cv_languages_attributes,
      research_or_project_details_attributes: [ :id, :title, :description, :duration, :guide,:_destroy],
      trainings_attributes: [ :id, :name, :info, :duration, :institute, :_destroy],
      honor_and_awards_attributes: [ :id, :award_date, :company, :title, :awarded_by, :_destroy],
      references_attributes: [ :id, :name, :designation, :companyname, :email, :contact_no, :_destroy],
      cv_skills_attributes: [:id, :skill, :skill_id, :self_rating, :_destroy],
      certifications_attributes: [:id, :digital_cv_id, :date, :title, :certifier, :_destroy],
     )
  end

  def employment_details_attributes
    [
      :id, :job_title_id, :digital_cv_id, :company_id, :achievement, :responsibilities,
      :start_date, :end_date, :present_job, :industry_name, :_destroy,
      company_attributes: [:website, :name, :id]
    ]
  end

  def academic_details_attributes
    [
      :institution, :id, :digital_cv_id, :degree_id, :specialization_id,
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
