class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = Employee.find_by(firstname: params[:firstname])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { user: EmployeeSerializer.new(user), jwt: token }, status: :accepted
    else
      render json: [error: "Invalid username or password"], status: :unauthorized
    end
  end
end
