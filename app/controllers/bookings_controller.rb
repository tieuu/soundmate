class BookingsController < ApplicationController

    def new
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new
    end

    def create
    @booking = Booking.new(booking_params)
    @booking.equipment = Equipment.find(params[:equipment_id])
    @booking.user = current_user
    # @booking.start_date = params[:start_date]
    # @booking.end_date = params[:end_date]
    @booking.status = "pending"
    binding.pry
    @booking.save
    end

  private

  def booking_params
    params.require(:booking).permit(:equipment_id, :user_id, :start_date, :end_date)
  end
end
