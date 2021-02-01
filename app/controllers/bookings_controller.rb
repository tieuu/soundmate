class BookingsController < ApplicationController
  before_action :set_booking, only: [:update]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
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
      redirect_to bookings_path
    else
      render 'equipment/show'
    end
  end

  def update
    binding.pry
    @booking.update(booking_params)
    @bookings = Booking.all
    authorize @bookings
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:equipment_id, :user_id, :start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
