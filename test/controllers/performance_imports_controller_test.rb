require 'test_helper'

class PerformanceImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get performance_imports_new_url
    assert_response :success
  end

end
