class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_page
    @page_number = params[:page].present? && params[:page].to_i > 0 ? params[:page].to_i - 1 : 0
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

end
