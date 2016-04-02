class UsersController < ApplicationController
  before_action :set_user, :set_games_user, :set_user_proficiency,
      only: [:show, :edit, :update, :destroy, :endorse]
  helper_method :is_current_user?, :proficiencies_for_game, :get_list_of_games,
      :endorsements_for_proficiency, :number_of_games, :number_of_proficiencies,
      :user_rating, :get_teams_for_game, :endorsed?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.nil?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @user.id != session[:session_key]
      redirect_to action: :show
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.permission_level = 1
    @user.slug = @user.username.downcase.gsub(" ", "-")

    respond_to do |format|
      if @user.save
        login @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.juserson
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # /profile
  def profile
    redirect_to @user
  end

  # restrict user if not logged in
  def allowed?
    !session[:session_key].nil?
  end

  def is_current_user?
    @user.id == session[:session_key]
  end

  def proficiencies_for_game(game)
    @user.proficiencies.where game_id: game.id
  end

  def endorsements_for_proficiency(proficiency_id)
    endorserObjects = []
    get_endorsements(proficiency_id).each do |endorser|
      endorserObjects.push(User.find_by(username: endorser))
    end 
    endorserObjects
  end

  def get_list_of_games
    Game.all.select "id, name"
  end

  def number_of_games
    @user.games.count
  end

  def number_of_proficiencies
    @user.games.inject(0){ |sum, game| sum += game.proficiencies.count }
  end

  def user_rating
    # TODO: implement ratings
    12
  end

  def endorsed?(proficiency_id)
    if endorsers = get_endorsements(proficiency_id)
      return endorsers.include? current_user.username
    end
    false
  end

  def endorse
    if proficiency = @user.user_proficiencies.find_by(proficiency_id: params[:proficiency_id])
      if proficiency.endorsements
        proficiency.endorsements += ',' + current_user.username
      else
        proficiency.endorsements = current_user.username
      end
      proficiency.save
    end
    redirect_to(:back)
  end

  def get_teams_for_game(id)
    @user.teams.where(game_id: id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_slug(params[:id].downcase)
      if @user.picture_url.blank?
        # add default image
        @user.picture_url = 'https://s-media-cache-ak0.pinimg.com/736x/dd/11/1f/dd111ff5042dc332fef3e297df41ea75.jpg'
      end
    end

    def set_games_user
      @games_user = GamesUser.new
    end

    def set_user_proficiency
      @user_proficiency = UserProficiency.new
    end

    def get_endorsements(proficiency_id)
      if proficiency = @user.user_proficiencies.find_by(proficiency_id: proficiency_id)
        if endorsers = proficiency.endorsements
          return endorsers.split(',')
        end
      end
      []
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :description, :picture_url)
    end
end
