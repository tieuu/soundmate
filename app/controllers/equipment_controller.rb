class EquipmentController < ApplicationController
  def index
    @equipment = policy_scope(Equipment.search(params[:search]) || Equipment)
    authorize @equipment
  end

  def show
    @equipment = Equipment.find(params[:id])
    authorize @equipment
  end

  private

  def equipment_params
    params.require(:equipment).permit(:search)
  end
end
