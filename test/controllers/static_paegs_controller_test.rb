require 'test_helper'

class StaticPaegsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_paegs_home_url
    assert_response :success
  end

  test "should get help" do
    get static_paegs_help_url
    assert_response :success
  end

end
