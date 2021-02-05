class Api::V1::AuthenticationController < ApplicationController
  before_action :authenticate_request!, only: :logout

  def login
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      if @user.is_active
        @user.update(auth_token: SecureRandom.base64(16))
        render_json({ success: true, first_name: @user.first_name, auth_token: @user.auth_token})
      else
        render_json({ success: false, message: "Inactive user account"})  
      end
    else
      render_json({ success: false, message: "Invalid email or password"})
    end
  end

  def logout
    @current_user.update auth_token: nil  
  end

end