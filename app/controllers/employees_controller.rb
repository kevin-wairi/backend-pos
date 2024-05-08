class EmployeesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unporcessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  skip_before_action :authorized, only: [:index, :create, :show, :update,:destroy]

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
    password = params[:employee][:firstname]
    password_confirmation =  params[:employee][:firstname]
    employee = Employee.create!(employee_params)
    render json: employee, status: :created
    rescue ActiveRecord::RecordInvalid
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
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:firstname, :lastname,:email, :role, :phone_number,:business_name )
    end

    def render_unporcessable_entity
      render json: { error: "unprocessable entity" }, status: 404
    end
    def render_record_not_found
      render json: { error: "record not found" }, status: 404
    end
end
