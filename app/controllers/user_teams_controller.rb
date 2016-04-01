class UserTeamsController < ApplicationController
  before_action :set_user_team, only: [:show, :edit, :update, :destroy]

  # GET /user_teams
  # GET /user_teams.json
  def index
    @user_teams = UserTeam.all
  end

  # GET /user_teams/1
  # GET /user_teams/1.json
  def show
  end

  # GET /user_teams/new
  def new
    @user_team = UserTeam.new
  end

  # GET /user_teams/1/edit
  def edit
  end

  # POST /user_teams
  # POST /user_teams.json
  def create
    @user_team = UserTeam.new(user_team_params)
    @user_team.status = 0
    @user_team.save
    # TODO: May want to return a success message
    redirect_to(:back)
  end

  # PATCH/PUT /user_teams/1
  # PATCH/PUT /user_teams/1.json
  def update
    respond_to do |format|
      if @user_team.update(user_team_params)
        format.html { redirect_to @user_team, notice: 'User team was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_team }
      else
        format.html { render :edit }
        format.json { render json: @user_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_teams/1
  # DELETE /user_teams/1.json
  def destroy
    @user_team.destroy
    respond_to do |format|
      format.html { redirect_to user_teams_url, notice: 'User team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_team
      @user_team = UserTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_team_params
      params.require(:user_team).permit(:role, :requestMessage, :user_id, :team_id)
    end
end
