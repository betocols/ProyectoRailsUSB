require 'test_helper'

class CommentAsControllerTest < ActionController::TestCase
  setup do
    @comment_a = comment_as(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_as)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_a" do
    assert_difference('CommentA.count') do
      post :create, comment_a: {  }
    end

    assert_redirected_to comment_a_path(assigns(:comment_a))
  end

  test "should show comment_a" do
    get :show, id: @comment_a
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_a
    assert_response :success
  end

  test "should update comment_a" do
    put :update, id: @comment_a, comment_a: {  }
    assert_redirected_to comment_a_path(assigns(:comment_a))
  end

  test "should destroy comment_a" do
    assert_difference('CommentA.count', -1) do
      delete :destroy, id: @comment_a
    end

    assert_redirected_to comment_as_path
  end
end
