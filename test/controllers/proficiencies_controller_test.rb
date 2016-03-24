require 'test_helper'

class ProficienciesControllerTest < ActionController::TestCase
  #setup do
    # setup a logged-in user in order to avoid the error associated with login redirects
    #@test_user = User.create(username: "test_user", description: "test description", picture_url: "test_url", password: "password", password_confirmation:"password")
    #@game = games(:one)
    #@proficiency = proficiencies(:one)
    #@proficiency.game_id = @game.id
  #end

  #test "should get new" do
    #get :new, game_id: @game.id
    #assert_response :success
  #end

  #test "should create proficiency" do
    #assert_difference('Proficiency.count') do
      #post :create, proficiency: { description: @proficiency.description, game: @proficiency.game, name: @proficiency.name, picture_url: @proficiency.picture_url }, game_id: @game.id
    #end

    #assert_redirected_to proficiency_path(assigns(:proficiency))
  #end

  #test "should show proficiency" do
    #get :show, id: @proficiency, game_id: @game.id
    #assert_response :success
  #end

  #test "should get edit" do
    #get :edit, id: @proficiency, game_id: @game.id
    #assert_response :success
  #end

  #test "should update proficiency" do
    #patch :update, id: @proficiency, proficiency: { description: @proficiency.description, game: @proficiency.game, name: @proficiency.name, picture_url: @proficiency.picture_url }
    #assert_redirected_to proficiency_path(assigns(:proficiency)), game_id: @game.id
  #end

  #test "should destroy proficiency" do
    #assert_difference('Proficiency.count', -1) do
      #delete :destroy, id: @proficiency, game_id: @game.id
    #end

    #assert_redirected_to proficiencies_path
  #end
end
