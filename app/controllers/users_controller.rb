class UsersController < ApplicationController


  def create
    user = User.create(user_params)
    if user.valid?
      token = generate_token(user)
      render json: { success: true, token: token, user: user }.to_json, status: 200
    else
      render json: { success: false, message: "Username Taken" }
    end
  end

  def index
    authorized
    users = User.all
    render json: users
  end

  def show
    authorized
    student = User.find(params[:id])
    render json: student
  end

  def profile
    authorized
    render json: @current_user
  end

  def destroy
    authorized
    student = User.destroy(params[:id])
    render json: {message: "#{student.username} Has Been Removed"}
  end

  private

  def user_params
    params.permit(:username, :password, :teacher_id)
  end

end
