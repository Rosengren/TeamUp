class ProficienciesController < ApplicationController
  before_action :set_proficiency, only: [:show, :edit, :update, :destroy]

  # GET /proficiencies
  # GET /proficiencies.json
  def index
    @proficiencies = Proficiency.all
  end

  # GET /proficiencies/1
  # GET /proficiencies/1.json
  def show
  end

  # GET /proficiencies/new
  def new
    @proficiency = Proficiency.new
  end

  # GET /proficiencies/1/edit
  def edit
  end

  # POST /proficiencies
  # POST /proficiencies.json
  def create
    @proficiency = Proficiency.new(proficiency_params)

    respond_to do |format|
      if @proficiency.save
        format.html { redirect_to @proficiency, notice: 'Proficiency was successfully created.' }
        format.json { render :show, status: :created, location: @proficiency }
      else
        format.html { render :new }
        format.json { render json: @proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proficiencies/1
  # PATCH/PUT /proficiencies/1.json
  def update
    respond_to do |format|
      if @proficiency.update(proficiency_params)
        format.html { redirect_to @proficiency, notice: 'Proficiency was successfully updated.' }
        format.json { render :show, status: :ok, location: @proficiency }
      else
        format.html { render :edit }
        format.json { render json: @proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proficiencies/1
  # DELETE /proficiencies/1.json
  def destroy
    @proficiency.destroy
    respond_to do |format|
      format.html { redirect_to proficiencies_url, notice: 'Proficiency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proficiency
      @proficiency = Proficiency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proficiency_params
      params.require(:proficiency).permit(:game_id, :name, :description, :picture_url)
    end
end
