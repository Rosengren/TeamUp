class UserProficienciesController < ApplicationController
  before_action :set_user_proficiency, only: [:show, :edit, :update, :destroy]

  # GET /user_proficiencies
  # GET /user_proficiencies.json
  def index
    @user_proficiencies = UserProficiency.all
  end

  # GET /user_proficiencies/1
  # GET /user_proficiencies/1.json
  def show
  end

  # GET /user_proficiencies/new
  def new
    @user_proficiency = UserProficiency.new
  end

  # GET /user_proficiencies/1/edit
  def edit
  end

  # POST /user_proficiencies
  # POST /user_proficiencies.json
  def create
    @user_proficiency = UserProficiency.new(user_proficiency_params)
    @proficiency = Proficiency.find(@user_proficiency.proficiency_id)
    respond_to do |format|
      if @user_proficiency.save
        format.js {}
      else
        format.json { render json: @user_proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_proficiencies/1
  # PATCH/PUT /user_proficiencies/1.json
  def update
    respond_to do |format|
      if @user_proficiency.update(user_proficiency_params)
        format.html { redirect_to @user_proficiency, notice: 'User proficiency was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_proficiency }
      else
        format.html { render :edit }
        format.json { render json: @user_proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_proficiencies/1
  # DELETE /user_proficiencies/1.json
  def destroy
    @user_proficiency.destroy
    respond_to do |format|
      format.html { redirect_to user_proficiencies_url, notice: 'User proficiency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_proficiency
      @user_proficiency = UserProficiency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_proficiency_params
      params.require(:user_proficiency).permit(:endorsements, :user_id, :proficiency_id)
    end
end
