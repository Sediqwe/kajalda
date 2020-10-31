class ReceptsController < ApplicationController
  before_action :set_recept, only: [:show, :edit, :update, :destroy]

  # GET /recepts
  # GET /recepts.json
  def index
    @recepts = Recept.all
  end

  # GET /recepts/1
  # GET /recepts/1.json
  def show

    @data = ReceptConnect.where(recept_id: params[:id])
  end

  # GET /recepts/new
  def new
    @recept = Recept.new
  end

  # GET /recepts/1/edit
  def edit
  end

  # POST /recepts
  # POST /recepts.json
  def create
    @recept = Recept.new(recept_params)

    respond_to do |format|
      if @recept.save
        format.html { redirect_to @recept, notice: 'Recept was successfully created.' }
        format.json { render :show, status: :created, location: @recept }
      else
        format.html { render :new }
        format.json { render json: @recept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recepts/1
  # PATCH/PUT /recepts/1.json
  def update
    respond_to do |format|
      if @recept.update(recept_params)
        format.html { redirect_to @recept, notice: 'Recept was successfully updated.' }
        format.json { render :show, status: :ok, location: @recept }
      else
        format.html { render :edit }
        format.json { render json: @recept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recepts/1
  # DELETE /recepts/1.json
  def destroy
    @recept.destroy
    respond_to do |format|
      format.html { redirect_to recepts_url, notice: 'Recept was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recept
      @recept = Recept.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recept_params
      params.require(:recept).permit(:name, :recept_type_id)
    end
end
