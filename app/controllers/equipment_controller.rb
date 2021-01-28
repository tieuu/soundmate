class EquipmentController < ApplicationController
  def index
    @equipments = policy_scope(Equipment.search(params[:search]) || Equipment)
  end

  def new
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
      render :new
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    authorize @equipment
  end

  private

  def equipment_params
    params.require(:equipment).permit(:category, :ad_name, :description, :price, :active, :search, photos: [])
  end
end
