class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :update]

  def index
    @equipments = policy_scope(Equipment.search(params[:search]) || Equipment)
  end

  def my_equipment
    @equipments = Equipment.where(user: current_user).order(created_at: :desc)
    authorize @equipments

    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    authorize @equipment
    if @equipment.save
      redirect_to :my_equipment
    else
      @equipments = Equipment.where(user: current_user)
      authorize @equipments
      render :my_equipment
    end
  end

  def show
    @booking = Booking.new
    authorize @booking
    authorize @equipment
    @marker = [{ lat: @equipment.user.latitude, lng: @equipment.user.longitude }]
  end

  def update
    @equipment.update(active: params[:active])
    authorize @equipment
    redirect_to my_equipment_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(:category, :ad_name, :description, :price, :active, :search, photos: [])
  end

  def set_equipment
    @equipment = Equipment.find(params[:id])
    authorize @equipment
  end
end
