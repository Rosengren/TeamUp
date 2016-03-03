require 'test_helper'

class ProficienciesControllerTest < ActionController::TestCase
  setup do
    @proficiency = proficiencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proficiencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proficiency" do
    assert_difference('Proficiency.count') do
      post :create, proficiency: { description: @proficiency.description, game: @proficiency.game, name: @proficiency.name, picture_url: @proficiency.picture_url }
    end

    assert_redirected_to proficiency_path(assigns(:proficiency))
  end

  test "should show proficiency" do
    get :show, id: @proficiency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proficiency
    assert_response :success
  end

  test "should update proficiency" do
    patch :update, id: @proficiency, proficiency: { description: @proficiency.description, game: @proficiency.game, name: @proficiency.name, picture_url: @proficiency.picture_url }
    assert_redirected_to proficiency_path(assigns(:proficiency))
  end

  test "should destroy proficiency" do
    assert_difference('Proficiency.count', -1) do
      delete :destroy, id: @proficiency
    end

    assert_redirected_to proficiencies_path
  end
end
