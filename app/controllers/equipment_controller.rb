class EquipmentController < ApplicationController
  def index
    @equipments = policy_scope(Equipment.search(params[:search]) || Equipment)
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  private

  def equipment_params
    params.require(:equipment).permit(:search)
  end
end
