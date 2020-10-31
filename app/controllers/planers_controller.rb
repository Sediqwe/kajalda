class PlanersController < ApplicationController
  def index
    @planers = Planer.all
  end
end
