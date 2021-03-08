class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameter, if: :devise_controller?
  
    protected
  
        def configure_permitted_parameter
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :type])
        end

  def name
   @name = current_user.name
  end

  def userkind
    if current_user.type == 'Admin'
      return true      
    else
      return false
    end  
  end
  
  end