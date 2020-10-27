class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_no_delete_user_ids

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_num])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_no_delete_user_ids
    if user_signed_in?
      no_delete_user_ids =[1,11,21,31,61,71,81,111,101] 
      no_delete_user_ids.each do |id|
        if id == current_user.id
          return @no_delete_user = true
        else
          @no_delete_user = false
        end
      end
    end
  end
end
