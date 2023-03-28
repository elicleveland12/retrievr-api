class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: jwt}
    else
      render json: {errors: "Please enter the correct email and password!"}
    end
  end

  def auto_login
    user = curr_user
    if user
      render json: user
    else
      render json: {errors: "Please log in first"}
    end
  end

  def send_reset_password_token
    user = User.find_by(email: params[:email])
    if user
      token = rand(100000..999999)
      user.update(reset_password_token: token)
      UserMailer.send_reset_password_token(user, token).deliver
      render json: {message: "Password reset email sent"}
    else
      render json: {errors: "No user found with that email"}
    end
  end

  def reset_password
    user = User.find_by(reset_password_token: params[:token])
    if user
      user.update(password: params[:password], reset_password_token: nil)
      render json: {message: "Password reset successful"}
    else
      render json: {errors: "Invalid token"}
    end
  end
end
