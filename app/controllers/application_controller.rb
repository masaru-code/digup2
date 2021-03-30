class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #basic認証
  before_action :basic_authentication
  before_action :configure_permitted_parameters, if: :devise_controller?  
  
    def after_sign_in_path_for(resource)
        dig_home_dighome_path
    end

    private
        def sign_in_required
            redirect_to new_user_session_url unless user_signed_in?
        end 
    
    #basic認証    
    def basic_authentication
      authenticate_or_request_with_http_basic do |name, password|
      name == "cckun" && password == "aideaippai2"
      end
    end
        
    protected
        def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
        end 

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        end
end
