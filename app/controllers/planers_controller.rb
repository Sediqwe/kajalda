class PlanersController < ApplicationController
  def index
    @planers = Planer.all
  end

  def show; end

  def update
    @planer = Planer.find(params[:id])
    @planer.update(planer_params)
  end

  def create; end

  private

  def planer_params
    params.require(:planer).permit( recept_ids:[])
  end
end
