require 'test_helper'

class RunsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:alex)
  end

  test "get index is successful" do
    get :index
    assert_includes assigns(:runs), runs(:alex_first_run)
    refute_includes assigns(:runs), runs(:bob_first_run)
    assert_response :success
  end

  test "get show is successful" do
    get :show, id: runs(:alex_first_run).id
    assert_equal runs(:alex_first_run), assigns(:run)
    assert_response :success
  end

  test "get new is successful" do
    get :new
    assert_kind_of Run, assigns(:run)
    assert_response :success
  end

  test "get edit is successful" do
    get :edit, id: runs(:alex_first_run).id
    assert_equal runs(:alex_first_run), assigns(:run)
    assert_response :success
  end

  test "post create is successful with valid attributes" do
    run_params = { date_of: "01/06/2016", distance: 3.5 }
    assert_difference "Run.count" do
      post :create, run: run_params
    end
    assert_redirected_to runs_path
  end

  test "post create is unsuccessful with invalid attributes" do
    invalid_params = { date_of: "", distance: nil }
    assert_no_difference "Run.count" do
      post :create, run: invalid_params
    end
    assert_template "new"
    assert_response :success
  end

  test "put update is successful with valid attributes" do
    valid_attributes = { date_of: "01/07/2016", distance: 4.7 }
    put :update, id: runs(:alex_first_run).id, run: valid_attributes
    assert_equal Date.new(2016, 1, 7), runs(:alex_first_run).reload.date_of
    assert_equal valid_attributes[:distance], runs(:alex_first_run).reload.distance
    assert_redirected_to runs_path
  end

  test "put update is unsuccessful with invalid attributes" do
    invalid_attributes = { date_of: "", distance: nil }
    put :update, id: runs(:alex_first_run).id, run: invalid_attributes
    refute_equal invalid_attributes[:date_of], runs(:alex_first_run).reload.date_of
    refute_equal invalid_attributes[:distance], runs(:alex_first_run).reload.distance
    assert_template "edit"
    assert_response :success
  end

  test "delete destroy is successful" do
    assert_difference 'Run.count', -1 do
      delete :destroy, id: runs(:alex_first_run)
    end
    assert_redirected_to runs_path
  end

  test "get leaderboard is successful" do
    get :leaderboard
    assert_equal ["Alex", "Bob"], assigns(:user_names)
    assert_equal [8.7, 4.1], assigns(:user_distances)
    assert_response :success
  end
end
