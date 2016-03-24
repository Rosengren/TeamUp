class UsersController < ApplicationController
  before_action :set_user, :set_games_user, only: [:show, :edit, :update, :destroy]
  helper_method :is_current_user?, :proficiencies_for_game, :endorsements_for_proficiency, :get_list_of_games

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
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
  # DELETE /users/1.json
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

  def endorsements_for_proficiency(proficiency)
    # TODO: implement this once endorsements had been added
    "List of endorsements"
  end

  def get_list_of_games
    Game.all.select "id, name"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_games_user
      @games_user = GamesUser.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :description, :picture_url)
    end
end
