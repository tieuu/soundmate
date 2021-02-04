class ReviewsController < ApplicationController
  before_action :set_equipment

  def new
    @review = Review.new
    @review.equipment = @equipment
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.equipment = @equipment
    authorize @review
    if @review.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_equipment
    @equipment = Equipment.find(params[:equipment_id])
  end
end
