class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def set_page
    @page_number = params[:page].present? && params[:page].to_i > 0 ? params[:page].to_i - 1 : 0
  end

end
