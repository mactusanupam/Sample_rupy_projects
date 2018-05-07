class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :store_user_location!, if: :storable_location?
  
  private

  def set_page
    @page_number = params[:page].present? && params[:page].to_i > 0 ? params[:page].to_i - 1 : 0
  end
  
  
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource_or_scope)
    sign_in_url = new_user_session_url
    if session[:user_return_to] || request.referer == sign_in_url
      return_to = session[:user_return_to]
      session[:user_return_to] = nil
      return_to
    else
      stored_location_for(resource_or_scope) || request.referer || root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer || super
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end

end
