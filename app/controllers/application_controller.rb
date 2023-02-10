class ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent
  def encode_token(payload)
    JWT.encode payload, ENV["jwt_key"]
  end

  def decoded_token
    begin
      JWT.decode auth_headers, nil, false
    rescue
      nil
    end
  end

  def auth_headers
    request.headers["Authorization"]
  end

  def curr_user
    begin
      user_id = decoded_token[0]["user_id"]
      User.find(user_id)
    rescue
      nil
    end
  end

  def logged_in
    !!curr_user
  end

  def authorized
    render json: {errors: 'Please log in'} unless logged_in
  end
end
