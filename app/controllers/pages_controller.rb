class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @products = Product.all
  end
  def showproduct
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      render action: 'showproduct' and return
    else
      render action: 'others_product'
    end
  end
end
