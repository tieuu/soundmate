class EquipmentController < ApplicationController
  before_action :set_equipment, only: %i[show update count_pending]

  def index
    @equipments = policy_scope(Equipment)
    if params[:search].present?
      query = params[:search][:query]
      category = params[:search][:category]
      if query.present? && category.present?
        @equipments = policy_scope(Equipment).search_equipment(query).search_equipment(category)
      elsif query.present?
        @equipments = policy_scope(Equipment).search_equipment(query)
      elsif category.present?
        @equipments = policy_scope(Equipment).search_equipment(category)
      end
    end
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
    redirect_to my_equipment_path(anchor: "equipment-#{@equipment.id}")
  end

  def count_pending
    respond_to do |format|
      format.json { render json: { pending_equipment: @equipment.bookings.where(status: 'pending') } }
    end
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
