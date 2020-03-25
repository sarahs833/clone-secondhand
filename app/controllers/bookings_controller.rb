class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id).includes(:product)
  end

  def show

  end

  def new
    @product = Product.find(params[:product_id])
    @booking = Booking.new
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(product_id: @product.id, user_id: current_user.id, paid:true)
    @booking.save
    redirect_to '/'
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def params_booking
    params.require(:booking).permit(:paid)
  end

end
