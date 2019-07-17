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
end
