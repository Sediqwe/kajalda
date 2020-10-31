class PageController < ApplicationController
  def index
    
  end

  def about
  end

  def planer
    @recept = Recept.all
  end
end
