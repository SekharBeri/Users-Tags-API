require 'json'
class ApplicationController < ActionController::API

  def authenticate_request!
    if request.headers["HTTP_AUTHENTICATION_TOKEN"].present?
      user = User.find_by(auth_token: JSON.parse(request.headers["HTTP_AUTHENTICATION_TOKEN"]))
      if user.present?
        @current_user = user
      else
        render_json({success: false, message: "Session expired!"})
      end
    else
      render_json({success: false, message: "Authtoken not present"})
    end
  end
  
  def render_json(options)
    render json: options
  end

end
