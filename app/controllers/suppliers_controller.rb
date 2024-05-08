class SuppliersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_supplier, only: %i[ show update destroy ]
  skip_before_action :authorized, only: [:index, :create, :show, :destroy, :update]

  # GET /suppliers
  def index
    @suppliers = Supplier.all

    render json: @suppliers
  end

  # GET /suppliers/1
  def show
    supplier = Supplier.find(params[:id])
    render json: supplier
  rescue ActiveRecord::RecordNotFound
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      render json: @supplier, status: :created, location: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params)
      render json: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # DELETE /suppliers/1
  def destroy
    @supplier.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def supplier_params
    params.require(:supplier).permit(:company_name, :firstname, :lastname, :phone_number, :email)
  end
  def render_not_found_response
    render json: { error: "record not found" }, status: 404
  end
end
