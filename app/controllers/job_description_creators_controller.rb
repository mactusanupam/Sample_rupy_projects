class JobDescriptionCreatorsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    session[:jd] = {} unless request.format.js?
    if params[:slug] == 'responsibility'
      @job_title = JobTitle.find_by(id: session[:jd]['position_details']['job_title_id']) if session[:jd]['position_details'].present?
    end
  end

  def create
    session[:jd] ||= {}
    if params.has_key? :position_details
      session[:jd][:position_details] = params[:position_details]
    elsif params.has_key? :job_requirements
      session[:jd][:job_requirements] = params[:job_requirements]
    elsif params.has_key? :job_responsibilities
      session[:jd][:job_responsibilities] = params[:job_responsibilities]
    else
      session[:jd][:application_process] = params[:application_process]
    end
  end

  def save_responsibility
    @responsibility = JobResponsibility.new(job_responsibility_params)
    @responsibility.save!
  end

  def download
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "template1"
      end
    end
  end

  private

  def company_params(pd)
    pd.fetch(:company_details).permit( :id, :name, :website, :about)
  end

  def job_responsibility_params
    params.fetch(:job_responsibility).permit( :id,:responsibility_text, :responsibility_type, :job_title_id )
  end
end
