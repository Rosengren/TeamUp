require 'test_helper'

class UserProficienciesControllerTest < ActionController::TestCase
  setup do
    @user_proficiency = user_proficiencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_proficiencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_proficiency" do
    assert_difference('UserProficiency.count') do
      post :create, user_proficiency: { endorsements: @user_proficiency.endorsements }
    end

    assert_redirected_to user_proficiency_path(assigns(:user_proficiency))
  end

  test "should show user_proficiency" do
    get :show, id: @user_proficiency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_proficiency
    assert_response :success
  end

  test "should update user_proficiency" do
    patch :update, id: @user_proficiency, user_proficiency: { endorsements: @user_proficiency.endorsements }
    assert_redirected_to user_proficiency_path(assigns(:user_proficiency))
  end

  test "should destroy user_proficiency" do
    assert_difference('UserProficiency.count', -1) do
      delete :destroy, id: @user_proficiency
    end

    assert_redirected_to user_proficiencies_path
  end
end
