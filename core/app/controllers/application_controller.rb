class ApplicationController < ActionController::Base
    include SessionsHelper

    private
        def logged_in_user
            unless logged_in?
            store_location
            flash[:danger] = 'Please log in.'
            redirect_to login_path, status: :see_other
            end
        end
end
