class StaticPagesController < ApplicationController
  def index
  end

  def contact_us
  end

  def about_us
  end

  def resume_builder
  end

  def resume_pricing
    @plans = DigitalCvPlan.all
    @digital_cv = DigitalCv.find_by(id: cookies[:digital_cv])
  end

  def states
    render json: Hash[CS.get(params[:countrycode]).sort_by{|k, v| v}]
  end

  def cities
    render json: CS.get(params[:country], params[:state])
  end
end
