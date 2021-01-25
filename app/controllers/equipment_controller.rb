class EquipmentController < ApplicationController

  def index
    @equipment = Equipment.search(params[:search]) || Equipment.all
  end

  private

  def equipment_params
    params.require(:equipment).permit(:search)
  end
end
