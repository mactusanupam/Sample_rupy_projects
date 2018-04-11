class StaticPagesController < ApplicationController
  def index
  end

  def contact_us
    @message = Message.new
  end

  def about_us
  end

  def resume_builder
  end

  def states
    render json: Hash[CS.get(params[:countrycode]).sort_by{|k, v| v}]
  end

  def cities
    render json: CS.get(params[:country], params[:state])
  end
end
