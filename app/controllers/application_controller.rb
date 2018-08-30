class ApplicationController < ActionController::API
include ActionController::HttpAuthentication::Token::ControllerMethods

  def generate_token(user)
    alg = 'HS256'
    payload = { user_id: user.id }
    JWT.encode payload, Rails.application.credentials.secret, alg
  end

  def authorized
    render json: {message: "Please Log In to Continue"}, status: 401 unless logged_in?
  end

  private

  def current_user
    authenticate_or_request_with_http_token do |jwt_token, options|
      begin
        decoded_token = JWT.decode(jwt_token, Rails.application.credentials.secret)
      rescue JWT::DecodeError
        return nil
      end

      if decoded_token[0]["user_id"]
        @current_user ||= User.find(decoded_token[0]["user_id"])
      end
    end
  end

  def logged_in?
    !!current_user
  end

end
