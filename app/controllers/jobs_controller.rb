class JobsController < ApplicationController
  PAGE_SIZE = 25
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_job, only: [:edit, :update, :destroy, :apply, :job_applied, :job_status_update, :suspicious_job]

  after_action :verify_authorized, except: [:index, :show, :job_application]
  before_action :set_page, only: [:index]

  # GET /jobs
  def index
    @industry = Industry.all
    @company= Company.all
    @jobs_total = job_search_results
    @jobs = @jobs_total.limit(PAGE_SIZE).offset(@page_number * PAGE_SIZE)
  end

  # GET /jobs/1
  def show
    @job = Job.find(params[:id])
    Job.increment_counter(:job_view, @job.id)
  end

  # GET /jobs/new
  def new
    @job = Job.new
    authorize Job
    @job.skills.build
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)
    authorize Job
    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    redirect_to jobs_url, notice: 'Job was successfully destroyed.'
  end

  def apply
    @application = @job.job_applications.build(job_application_params)

    if request.post?
      @application.save
      redirect_to jobs_url, notice: 'Job applied successfully.'
    end
  end

  def job_status_update
    @job.update_column(:job_status, params[:job][:job_status])
  end

  def job_application
    @job_applications = current_user.job_applications.joins(:job)
  end

  def job_applied
    @job_applications = @job.job_applications.joins(:job)
  end

  def job_application_update
    @job_application = JobApplication.find(params[:application_id])
    authorize @job_application.job
    if request.post?
      @job_application.update(job_application_params)
    end
  end

  def suspicious_job
    @suspicious_job = @job.suspicious_jobs.build(suspicious_job_params)
    @suspicious_job.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
      authorize @job
    end

    def job_search_results
      scope = Job.active
      scope = scope.where("location LIKE ?", "%#{params[:location]}%") if params[:location].present?
      scope = scope.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
      scope = scope.where(company_id: params[:company_id]) if params[:company_id].present?
      scope = scope.where(industry_id: params[:industry_id]) if params[:industry_id].present?
      scope.order('id DESC')
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.fetch(:job,{}).permit(:min_exp, :max_exp, :title, :industry_id, :company_id, :location, :offered_ctc,
       :qualification_id, :website_url,
       :experience, :description,:user_id,:job_view,:no_of_openings,:job_status,:job_type, :seniority_level,
        :remote_location, :specialization_id, degree_ids:[], skill_ids:[])
    end

    def job_application_params
      params.fetch(:job_application, {}).permit(:document,:job_id,:user_id,:recruiter_comment, :status)
    end

    def suspicious_job_params
      params.fetch(:suspicious_job,{}).permit(:job_id, :reporter_email, :comment, :additional_comment)
    end

end
