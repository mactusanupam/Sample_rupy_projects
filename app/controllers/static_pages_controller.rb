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
end
