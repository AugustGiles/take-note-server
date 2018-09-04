class AuthController < ApplicationController

  def login
    username = params[:username]
    pw = params[:password]
    user = User.find_by(username: username)

    #call separate functions?
    if user && user.authenticate(pw)

      @current_user = user
      render json: { success: true, token: generate_token(user), user: user}
    else
      render json: { success: false, message: "Incorrect Username or Password" }, status: 401
    end
  end

end
