class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :require_login
    


    def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
        else
          @current_user = nil
        end
    end

    def is_logged_in?
        !!current_user
    end

    def require_login
      redirect_to root_path unless is_logged_in?
    end
end
