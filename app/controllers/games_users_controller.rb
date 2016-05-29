class GamesUsersController < ApplicationController
  before_action :set_games_user, only: [:destroy]

  # POST /games_user
  # POST /games_user.json
  def create
    # TODO: determine if game already exists

    @games_user = GamesUser.new(games_user_params)
    @game = Game.find(@games_user.game_id)
    respond_to do |format|
      if @games_user.save
        format.js {}
      else
        format.json { render json: @user_proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games_user/1
  # DELETE /games_user/1.json
  def destroy
    @games_user.active = INACTIVE
    respond_to do |format|
      if @games_user.save
        format.js {}
      else
        format.json { render json: @user_proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_games_user
      @games_user = GamesUser.find_by(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def games_user_params
      params.require(:games_user).permit(:user_id, :game_id)
    end
end
