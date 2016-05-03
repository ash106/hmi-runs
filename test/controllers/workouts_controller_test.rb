require 'test_helper'

class WorkoutsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:alex)
  end

  test "get index is successful" do
    get :index
    assert_includes assigns(:workouts), workouts(:alex_first_workout)
    refute_includes assigns(:workouts), workouts(:bob_first_workout)
    assert_response :success
  end

  test "get show is successful" do
    get :show, id: workouts(:alex_first_workout).id
    assert_equal workouts(:alex_first_workout), assigns(:workout)
    assert_response :success
  end

  test "get new is successful" do
    get :new
    assert_kind_of Workout, assigns(:workout)
    assert_response :success
  end

  test "get edit is successful" do
    get :edit, id: workouts(:alex_first_workout).id
    assert_equal workouts(:alex_first_workout), assigns(:workout)
    assert_response :success
  end

  test "post create is successful with valid attributes" do
    workout_params = { date_of: "01/06/2016", length: 25 }
    assert_difference "Workout.count" do
      post :create, workout: workout_params
    end
    assert_redirected_to workouts_path
  end

  test "post create is unsuccessful with invalid attributes" do
    invalid_params = { date_of: "", length: nil }
    assert_no_difference "Workout.count" do
      post :create, workout: invalid_params
    end
    assert_template "new"
    assert_response :success
  end

  test "put update is successful with valid attributes" do
    valid_attributes = { date_of: "01/08/2016", length: 30 }
    put :update, id: workouts(:alex_first_workout).id, workout: valid_attributes
    assert_equal Date.new(2016, 1, 8), workouts(:alex_first_workout).reload.date_of
    assert_equal valid_attributes[:length], workouts(:alex_first_workout).reload.length
    assert_redirected_to workouts_path
  end

  test "put update is unsuccessful with invalid attributes" do
    invalid_attributes = { date_of: "", length: nil }
    put :update, id: workouts(:alex_first_workout).id, workout: invalid_attributes
    refute_equal invalid_attributes[:date_of], workouts(:alex_first_workout).reload.date_of
    refute_equal invalid_attributes[:length], workouts(:alex_first_workout).reload.length
    assert_template "edit"
    assert_response :success
  end

  test "delete destroy is successful" do
    assert_difference 'Workout.count', -1 do
      delete :destroy, id: workouts(:alex_first_workout)
    end
    assert_redirected_to workouts_path
  end

  test "get leaderboard is successful" do
    get :leaderboard
    assert_equal [{ name: "Alex", total_time: 35 },{ name: "Bob", total_time: 20 }], assigns(:users)
    assert_response :success
  end
end
