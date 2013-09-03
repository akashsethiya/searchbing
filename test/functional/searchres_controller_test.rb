require 'test_helper'

class SearchresControllerTest < ActionController::TestCase
  setup do
    @searchre = searchres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searchres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create searchre" do
    assert_difference('Searchre.count') do
      post :create, searchre: { keyword: @searchre.keyword, query: @searchre.query, url: @searchre.url }
    end

    assert_redirected_to searchre_path(assigns(:searchre))
  end

  test "should show searchre" do
    get :show, id: @searchre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @searchre
    assert_response :success
  end

  test "should update searchre" do
    put :update, id: @searchre, searchre: { keyword: @searchre.keyword, query: @searchre.query, url: @searchre.url }
    assert_redirected_to searchre_path(assigns(:searchre))
  end

  test "should destroy searchre" do
    assert_difference('Searchre.count', -1) do
      delete :destroy, id: @searchre
    end

    assert_redirected_to searchres_path
  end
end
