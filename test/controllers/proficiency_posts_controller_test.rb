require 'test_helper'

class ProficiencyPostsControllerTest < ActionController::TestCase
  setup do
    @proficiency_post = proficiency_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proficiency_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proficiency_post" do
    assert_difference('ProficiencyPost.count') do
      post :create, proficiency_post: { content: @proficiency_post.content, date: @proficiency_post.date, title: @proficiency_post.title, username: @proficiency_post.username }
    end

    assert_redirected_to proficiency_post_path(assigns(:proficiency_post))
  end

  test "should show proficiency_post" do
    get :show, id: @proficiency_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proficiency_post
    assert_response :success
  end

  test "should update proficiency_post" do
    patch :update, id: @proficiency_post, proficiency_post: { content: @proficiency_post.content, date: @proficiency_post.date, title: @proficiency_post.title, username: @proficiency_post.username }
    assert_redirected_to proficiency_post_path(assigns(:proficiency_post))
  end

  test "should destroy proficiency_post" do
    assert_difference('ProficiencyPost.count', -1) do
      delete :destroy, id: @proficiency_post
    end

    assert_redirected_to proficiency_posts_path
  end
end
