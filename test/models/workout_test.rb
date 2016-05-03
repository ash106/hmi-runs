require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  test "has valid test data" do
    Workout.find_each do |workout|
      assert_valid workout
    end
  end

  test "must have a length date_of and user_id" do
    invalid_workout = Workout.new
    assert_invalid invalid_workout
    assert_includes invalid_workout.errors[:length], "can't be blank"
    assert_includes invalid_workout.errors[:date_of], "can't be blank"
    assert_includes invalid_workout.errors[:user_id], "can't be blank"
  end
end
