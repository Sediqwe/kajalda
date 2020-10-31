class ReceptConnectsController < ApplicationController
  before_action :set_recept_connect, only: [:show, :edit, :update, :destroy]

  # GET /recept_connects
  # GET /recept_connects.json
  def index
    @recept_connects = ReceptConnect.all
  end

  # GET /recept_connects/1
  # GET /recept_connects/1.json
  def show
    
  end

  # GET /recept_connects/new
  def new
    @recept_connect = ReceptConnect.new
  end

  # GET /recept_connects/1/edit
  def edit
  end

  # POST /recept_connects
  # POST /recept_connects.json
  def create
    @recept_connect = ReceptConnect.new(recept_connect_params)

    respond_to do |format|
      if @recept_connect.save
        format.html { redirect_to @recept_connect, notice: 'Recept connect was successfully created.' }
        format.json { render :show, status: :created, location: @recept_connect }
      else
        format.html { render :new }
        format.json { render json: @recept_connect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recept_connects/1
  # PATCH/PUT /recept_connects/1.json
  def update
    respond_to do |format|
      if @recept_connect.update(recept_connect_params)
        format.html { redirect_to @recept_connect, notice: 'Recept connect was successfully updated.' }
        format.json { render :show, status: :ok, location: @recept_connect }
      else
        format.html { render :edit }
        format.json { render json: @recept_connect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recept_connects/1
  # DELETE /recept_connects/1.json
  def destroy
    @recept_connect.destroy
    respond_to do |format|
      format.html { redirect_to recept_connects_url, notice: 'Recept connect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recept_connect
      @recept_connect = ReceptConnect.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recept_connect_params
      params.require(:recept_connect).permit(:recept_id, :material_id, :size_id)
    end
end
