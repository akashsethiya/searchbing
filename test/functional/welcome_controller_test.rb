require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get enter" do
    get :enter
    assert_response :success
  end

end
