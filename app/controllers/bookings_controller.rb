class BookingsController < ApplicationController
    def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.equipment = Equipment.find(params[:equipment_id])
    @booking.user = User.find(params[:user_id])
    @booking.start_date = Booking.find[:start_date]
    @booking.end_date = Booking.find[:end_date]
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
  params.require(:booking).permit(:equipment_id, :user_id, :start_date, :end_date)
  end
end
