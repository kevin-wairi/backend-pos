class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(username: params[:lastname])
    if user & authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { user: userSerializer.new(user), jwt: token }, status: :accepted
    else
      render json: [error: "Invalid username or password"], status: :unauthorized
    end
  end
end
