class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @products = Product.all
  end
  def showproduct
    @product = Product.find(params[:id])
  end


  private

  def params_product
    params.require(:product).permit(:name, :price)
  end

end
