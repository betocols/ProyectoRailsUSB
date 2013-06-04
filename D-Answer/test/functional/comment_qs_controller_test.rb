require 'test_helper'

class CommentQsControllerTest < ActionController::TestCase
  setup do
    @comment_q = comment_qs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comment_qs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comment_q" do
    assert_difference('CommentQ.count') do
      post :create, comment_q: {  }
    end

    assert_redirected_to comment_q_path(assigns(:comment_q))
  end

  test "should show comment_q" do
    get :show, id: @comment_q
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comment_q
    assert_response :success
  end

  test "should update comment_q" do
    put :update, id: @comment_q, comment_q: {  }
    assert_redirected_to comment_q_path(assigns(:comment_q))
  end

  test "should destroy comment_q" do
    assert_difference('CommentQ.count', -1) do
      delete :destroy, id: @comment_q
    end

    assert_redirected_to comment_qs_path
  end
end
