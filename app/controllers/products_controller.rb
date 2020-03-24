class ProductsController < ApplicationController

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(params_product)
    @product.user = current_user
    authorize @product
    @product.save
    redirect_to "/"
  end

  def user
    @user = current_user
    @products = Product.where(user_id: @user.id)
    authorize @products
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def update
    @product = Product.find(params[:id])
    authorize @product
    @product.update(params_product)
    redirect_to '/products/user'
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to '/products/user'

  end


  private

  def params_product
    params.require(:product).permit(:name, :price)
  end


end
