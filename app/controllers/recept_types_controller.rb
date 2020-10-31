class ReceptTypesController < ApplicationController
  before_action :set_recept_type, only: [:show, :edit, :update, :destroy]

  # GET /recept_types
  # GET /recept_types.json
  def index
    @recept_types = ReceptType.all
  end

  # GET /recept_types/1
  # GET /recept_types/1.json
  def show
  end

  # GET /recept_types/new
  def new
    @recept_type = ReceptType.new
  end

  # GET /recept_types/1/edit
  def edit
  end

  # POST /recept_types
  # POST /recept_types.json
  def create
    @recept_type = ReceptType.new(recept_type_params)

    respond_to do |format|
      if @recept_type.save
        format.html { redirect_to @recept_type, notice: 'Recept type was successfully created.' }
        format.json { render :show, status: :created, location: @recept_type }
      else
        format.html { render :new }
        format.json { render json: @recept_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recept_types/1
  # PATCH/PUT /recept_types/1.json
  def update
    respond_to do |format|
      if @recept_type.update(recept_type_params)
        format.html { redirect_to @recept_type, notice: 'Recept type was successfully updated.' }
        format.json { render :show, status: :ok, location: @recept_type }
      else
        format.html { render :edit }
        format.json { render json: @recept_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recept_types/1
  # DELETE /recept_types/1.json
  def destroy
    @recept_type.destroy
    respond_to do |format|
      format.html { redirect_to recept_types_url, notice: 'Recept type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recept_type
      @recept_type = ReceptType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recept_type_params
      params.require(:recept_type).permit(:name)
    end
end
