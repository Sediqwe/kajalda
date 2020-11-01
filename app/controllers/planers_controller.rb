class PlanersController < ApplicationController
  def index
    @planers = Planer.all   
  end

  def show
   
  end
  
  def update
    @planer = Planer.find(params[:id])
    respond_to do |format|
      if @planer.update(planer_params)
        format.html { redirect_to Planer, alert: 'A heti menü frissítve!' }
        
      else
        format.html { redirect_to Planer, notice: 'Valami gebasz van!!' }
        
      end
    end
  end
  def create
  
  end
private
  def planer_params
    params.require(:planer).permit( recept_ids:[])
  end

end

