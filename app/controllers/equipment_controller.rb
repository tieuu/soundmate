class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show]

  def index
    @equipments = policy_scope(Equipment.search(params[:search]) || Equipment)
  end

  def my_equipment
    @equipments = Equipment.where(user: current_user)
    authorize @equipments

    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    authorize @equipment
    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      @equipments = Equipment.where(user: current_user)
      authorize @equipments
      render :my_equipment
    end
  end

  def show
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
