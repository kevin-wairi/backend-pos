class BrandsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]

  # GET /brands
  def index
    @brands = Brand.all

    render json: @brands
  end

  # GET /brands/1
  def show
    render json: @brand
  end

  # POST /brands
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      render json: @brand, status: :created, location: @brand
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /brands/1
  def update
    brand = Brand.find(params[:id])
    if brand.update(brand_params)
      render json: brand,status: :ok
    else
      render json: brand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /brands/1
  def destroy
    @brand.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brand_params
      params.permit(:name, :description)
    end
end
