class ApplicationController < ActionController::Base

  # before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :dob, :address, :phone_number, :gender])  
  end

  # private

  # def after_sign_in_path_for(resource)
  #   if resource.has_role? :admin
  #     admin_dashboard_path  # Redirect admins to the admin dashboard
  #   elsif resource.has_role? :manager
  #     manager_dashboard_path  # Redirect managers to the manager dashboard
  #   elsif resource.has_role? :receptionist
  #     receptionist_dashboard_path  # Redirect receptionists to the receptionist dashboard
  #   else
  #     root_path  # Default redirect path for users without specific roles
  #   end
  # end

  

  # private 

  def after_sign_in_path_for(resource)
    if resource.has_role? :admin 
      admin_dashboard_index_path
    else
      root_path
    end
  end
  
end
