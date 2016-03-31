class PagesController < ApplicationController
  #helper_method :update_permission

  # setup all the new ActiveRecord objects that can be added
  def admin
    @game = @game.nil? ? Game.new : @game
    @proficiency = @proficiency.nil? ? Proficiency.new : @proficiency
  end

  # create the game
  def create
    @game = Game.new
    @proficiency = Proficiency.new
    if params.has_key?(:create_game)
      @game = Game.new(game_params)
      @game.slug = @game.name.downcase.gsub(" ", "-")
  
      respond_to do |format|
        if @game.save
          format.html { render :admin, notice: 'Game was successfully created.'
          }
          format.json { render json: @game.name, status: :created, location: @game }
          @game = Game.new
        else
          format.html { render :admin }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    elsif params.has_key?(:create_proficiency)
      @proficiency = Proficiency.new(proficiency_params)
      @proficiency.slug = @proficiency.name.downcase.gsub(" ", "-")
  
      respond_to do |format|
        if @proficiency.save
          format.html { render :admin, notice: 'Proficiency was successfully created.'
          }
          format.json { render json: @proficiency.name, status: :created, location: @proficiency }
          @proficiency = Proficiency.new
        else
          format.html { render :admin }
          format.json { render json: @proficiency.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update_permission
    fail
  end
    

  # private parameter accessors
  private

    def game_params
      params.require(:game).permit(:name, :description, :picture_url)
    end

    def proficiency_params
      params.require(:proficiency).permit(:game_id, :name, :description, :picture_url)
    end
end
