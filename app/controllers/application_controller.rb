class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_calendar

    protected
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:birthday, :name])
    end

    def after_sign_in_path_for(resource_or_scope)
        if resource_or_scope
            user_path(current_user)
        else
            root_path
        end
    end

    def after_inactive_sign_up_path_for(resource)
        user_path(current_user)
    end

end
