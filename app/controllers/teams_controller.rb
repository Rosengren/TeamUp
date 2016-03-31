class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :requestDecision]
  helper_method :game_name, :get_role, :is_user_on_team?, :get_pending_requests, :team_members

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find_by_slug(params[:id])

    if @team.nil?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def requestDecision

    decision = @team.user_teams.find_by(user_id: params[:user_id])
    if params[:decision] == 'true'
      decision.status = 1
    else
     decision.destroy
    end

    respond_to do |format|
      if decision.save
        format.html { redirect_to @team, notice: 'Decisions have been made.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /teams/new
  def new
    @team = Team.new
    @role = ""
  end

  # GET /teams/1/edit
  def editfind_by_slug
  end

  # POST /teams/1/joinRequest
  def joinRequest
    @team = Team.find_by_slug(params[:id])

    begin
      @team.users.push(User.find(session[:session_key]))
    rescue
    end

    respond_to do |format|
      if @team.save
        user_teams = @team.user_teams.find_by(user_id: session[:session_key])
        user_teams.status = 0
        user_teams.role = params[:role]
        user_teams.requestMessage = params[:message]
        user_teams.save
        format.html { redirect_to @team, notice: 'Request was successfully sent.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :show }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.slug = @team.name.downcase.gsub(" ", "-")

    @team.community_rating = 0

    @user = User.find(session[:session_key])

    respond_to do |format|
      if @team.save
        @team.users.push(@user)
	@team.users
        @team.save
        user_teams = @team.user_teams.find_by(user_id: @user.id)
	user_teams.role = params[:role]
        user_teams.status = 1
        user_teams.save!
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1find_by_slug
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json    def set_team
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def game_name
    Game.find(@team.game_id).name
  end

  def get_role (user_id)
    @team.user_teams.find_by(user_id: user_id).role
  end

  def is_user_on_team?
    userOnTeam = @team.user_teams.find_by(user_id: session[:session_key])
    if userOnTeam != nil and userOnTeam.status == 1
      true
    else
      false
    end
  end
    
  def get_pending_requests
    @team.user_teams.where(status: 0)
  end

  def team_members
    team_members = []
    @team.user_teams.where(status: 1).each do |userTeam|
      team_members.push(User.find(userTeam.user_id))
    end
    team_members
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:game_id, :name, :description, :location, :picture_url, :role)
    end
end
