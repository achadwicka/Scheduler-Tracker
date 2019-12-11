class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_doctor!
  #before_action :authenticate_admin!
  #before_action :authenticate_client!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :rut, :cel_number, :birth_date, :first_name, :last_name)}

       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :birth_date, :cel_number, :email, :password, :current_password)}

	end
end
