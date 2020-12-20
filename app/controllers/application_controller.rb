class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_any!
    if professor_signed_in?
      true
    else
        authenticate_user!
    end
  end

  private

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_k, :nickname, :university, :undergraduate, :department])
      devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    else resource_class == Professor
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name_p, :name_k_p, :university_p, :undergraduate_p, :department_p, :professors_detail, :qualification, :image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:university_p, :undergraduate_p, :department_p,:professors_detail, :qualification, :image])
    end
  end

    def after_sign_in_path_for(resource)
      case resource
      when Professor
       professors_path
      when User
       subjects_path
      end
    end

end
