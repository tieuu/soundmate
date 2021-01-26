class EquipmentController < ApplicationController

  def index
    @equipment = Equipment.search(params[:search]) || Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  private

  def equipment_params
    params.require(:equipment).permit(:search)
  end
end
