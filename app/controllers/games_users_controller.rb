class GamesUsersController < ApplicationController
  before_action :set_games_user, only: [:destroy]

  # POST /games_user
  # POST /games_user.json
  def create
    @games_user = GamesUser.new(games_user_params)
    @games_user.save
    # TODO: May want to return a success message
    redirect_to(:back)
  end

  # DELETE /games_user/1
  # DELETE /games_user/1.json
  def destroy
    @games_user.destroy
    respond_to do |format|
      format.html { redirect_to games_user_url, notice: 'User game was successfully destroyed.' }
      format.json { head :no_content }
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
