class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    @product.user = current_user
    @product.save
    redirect_to "/"
  end

  def user
    @user = current_user
    @products = Product.where(user_id: @user.id)
  end

  private

  def params_product
    params.require(:product).permit(:name, :price)
  end

end
