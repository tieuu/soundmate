class BookingsController < ApplicationController
  def new
    @equipment = Equipment.find(params[:equipment_id])
    @booking = Booking.new
    authorize @booking
    authorize @equipment
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.equipment = Equipment.find(params[:equipment_id])
    @booking.user = current_user
    @booking.status = "pending"
    @equipment = @booking.equipment
    authorize @equipment
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  private

  def booking_params
    params.require(:booking).permit(:equipment_id, :user_id, :start_date, :end_date)
  end
end
