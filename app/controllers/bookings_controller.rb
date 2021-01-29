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
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @category = {
      "strings" => "https://images.unsplash.com/photo-1460036521480-ff49c08c2781?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=2704&q=80",
      "guitar" => "https://images.unsplash.com/photo-1525201548942-d8732f6617a0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80",
      "keyboard" => "https://images.unsplash.com/photo-1562166622-962955595c6a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80",
      "percussion" => "https://images.unsplash.com/photo-1543443283-8f4bb9683f54?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80",
      "brass" => "https://images.unsplash.com/photo-1511192336575-5a79af67a629?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=3578&q=80",
      "woodwind" => "https://images.unsplash.com/photo-1606139510019-a3e0bbc94c57?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2698&q=80",
      "equipment" => "https://images.unsplash.com/photo-1516575869513-3f418f8902ca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1233&q=80",
      "turntable" => "https://images.unsplash.com/photo-1485726696757-76885c99f0f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2000&q=80"
    }
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  private

  def booking_params
    params.require(:booking).permit(:equipment_id, :user_id, :start_date, :end_date)
  end
end
