require 'test_helper'

class RunTest < ActiveSupport::TestCase
  test "has valid test data" do
    Run.find_each do |run|
      assert_valid run
    end
  end

  test "must have a distance date_of and user_id" do
    invalid_run = Run.new
    assert_invalid invalid_run
    assert_includes invalid_run.errors[:distance], "can't be blank"
    assert_includes invalid_run.errors[:date_of], "can't be blank"
    assert_includes invalid_run.errors[:user_id], "can't be blank"
  end
end
