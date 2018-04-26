class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
      :password_confirmation, :user_type_id,:company_id,
      :company_attributes => [:name, :website])
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,
      :password_confirmation, :current_password, :user_type_id, 
      :company_id, :company_attributes =>  [:name, :website])
  end
end
