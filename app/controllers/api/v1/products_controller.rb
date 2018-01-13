class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]

  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  def create
    @product = Product.new(product_params)
    @product.save
    render json: @product, status: :created
  end

  def update
    @product.update(product_params)
    render json: @product, status: :updated
  end

  def destroy
    @product.destroy
    render json: {status: :deleted}
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end