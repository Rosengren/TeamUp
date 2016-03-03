class ProficiencyPostsController < ApplicationController
  before_action :set_proficiency_post, only: [:show, :edit, :update, :destroy]

  # GET /proficiency_posts
  # GET /proficiency_posts.json
  def index
    @proficiency_posts = ProficiencyPost.all
  end

  # GET /proficiency_posts/1
  # GET /proficiency_posts/1.json
  def show
  end

  # GET /proficiency_posts/new
  def new
    @proficiency_post = ProficiencyPost.new
  end

  # GET /proficiency_posts/1/edit
  def edit
  end

  # POST /proficiency_posts
  # POST /proficiency_posts.json
  def create
    @proficiency_post = ProficiencyPost.new(proficiency_post_params)

    respond_to do |format|
      if @proficiency_post.save
        format.html { redirect_to @proficiency_post, notice: 'Proficiency post was successfully created.' }
        format.json { render :show, status: :created, location: @proficiency_post }
      else
        format.html { render :new }
        format.json { render json: @proficiency_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proficiency_posts/1
  # PATCH/PUT /proficiency_posts/1.json
  def update
    respond_to do |format|
      if @proficiency_post.update(proficiency_post_params)
        format.html { redirect_to @proficiency_post, notice: 'Proficiency post was successfully updated.' }
        format.json { render :show, status: :ok, location: @proficiency_post }
      else
        format.html { render :edit }
        format.json { render json: @proficiency_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proficiency_posts/1
  # DELETE /proficiency_posts/1.json
  def destroy
    @proficiency_post.destroy
    respond_to do |format|
      format.html { redirect_to proficiency_posts_url, notice: 'Proficiency post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proficiency_post
      @proficiency_post = ProficiencyPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proficiency_post_params
      params.require(:proficiency_post).permit(:title, :username, :date, :content)
    end
end
