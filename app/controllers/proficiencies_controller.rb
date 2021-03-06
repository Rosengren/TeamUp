class ProficienciesController < ApplicationController
  before_action :set_proficiency, :set_game, only: [:show, :edit, :update, :destroy]
  helper_method :get_profile_picture, :endorsements_for_proficiency

  # GET /proficiencies
  # GET /proficiencies.json
  def index
    @proficiencies = Proficiency.all
  end

  # GET /proficiencies/1
  # GET /proficiencies/1.json
  def show
    @proficiency_posts = ProficiencyPost.where(proficiency_id: @proficiency.id)
    @proficiency_post ||= ProficiencyPost.new
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
    @proficiency.slug = @proficiency.name.downcase.gsub(" ", "-")

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

  def get_profile_picture(username)
    if user = User.find_by_slug(username.downcase)
      return user.picture_url
    end
    "http://i.istockimg.com/file_thumbview_approve/64396363/3/stock-photo-64396363-businessman-silhouette-as-avatar-or-default-profile-picture.jpg"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proficiency
      if !(@proficiency = Proficiency.find_by_slug(params[:id]))
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    def set_game
      @game = Game.find_by_slug(params[:game_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proficiency_params
      params.require(:proficiency).permit(:game_id, :name, :description, :picture_url)
    end
end
