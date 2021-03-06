class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

    if params[:query].nil? or params[:query] == ""
      @products = Product.all
    else
      @products = Product.search_by_name_description(params[:query])


    end

    if current_user
      @user_chats = Chat.where(booker: current_user.id).includes(:messages)
      .or(Chat.where(seller_id: current_user.id).includes(:messages))

      @user_chats.any? do |c|
        @answer = c.messages.any? do |m|
          m.new && (m.user_id != current_user.id)
        end
      end
    end
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
