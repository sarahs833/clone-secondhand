class BookingsController < ApplicationController
  def show

  end

  def new
    @product = Product.find(params[:product_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @user = current_user
    @product = Product.find(params[:product_id])
    @booking.user = @user
    @booking.product_id = @product_id
    @booking.save
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
