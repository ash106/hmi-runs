require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "extract_date should extract a date object from string" do
    expected_date = Date.new(2016, 1, 7)
    assert_equal expected_date, extract_date("01/07/2016")
  end
end
