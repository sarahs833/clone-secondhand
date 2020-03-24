class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    @product.user = current_user
    @product.save
  end

  private

  def params_product
    params.require(:product).permit(:name, :price)
  end

end
