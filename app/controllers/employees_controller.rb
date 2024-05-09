class EmployeesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unporcessable_entity
  skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.all

    render json: @employees
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    default_password = params[:lastname]
    employee_params_with_default_password = employee_params.merge(password: default_password, password_confirmation: default_password)

    employee = Employee.create!(employee_params_with_default_password)
    if employee.persisted?
      puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      UserMailer.with(user: employee).welcome_email(employee).deliver_now
    end
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    render json: employee, status: :created
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy!
  end

  private

  def render_unporcessable_entity(exception)
    errors = exception.record.errors.full_messages
    render json: { errors: errors }, status: :unprocessable_entity
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.permit(:firstname, :lastname, :email, :role, :phone_number, :business_name, :password, :password_confirmation)
  end
end
