class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unporcessable_entity
  skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]

  # GET /products
  def index
    products = Product.all
    render json: products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products :supplier_id, :quantity, :restock_level,:product_id
  def create
    product_params_to_use = params[:image] ? product_params : product_params_without_image
    product = Product.create!(product_params_to_use)
    puts "OKRRRRRRRRRRRR_______________________________________________________________________________________________________________________"
    supplier = Supplier.find_by(id: params[:supplier_id])
    puts "Supplier________________________________________________ #{supplier}"
    supplier.inventories.create!( restock_quantity: params[:restock_quantity], wholesale_price: params[:wholesale_price], retail_price: params[:retail_price], quantity: params[:quantity], restock_level: params[:restock_level], product_id: product.id, status: params[:status])
    render json: product, status: :created
  end

  # PATCH/PUT /products/1
  def update
    @product.update(product_params)
    render json: @product
  end

  # DELETE /products/1
  def destroy
    @product.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def render_unporcessable_entity
    render json: { error: "unprocessable entity" }, status: 404
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.permit(:title, :description, :product_type, :quantity, :retail_price, :sku, :category_id, :brand_id, :image)
  end

  def product_params_without_image
    params.permit(:title, :description, :product_type, :quantity, :retail_price, :sku, :category_id, :brand_id)
  end

end
