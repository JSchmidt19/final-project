require 'test_helper'

class FractalControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fractal_index_url
    assert_response :success
  end

  test "should get login" do
    get fractal_login_url
    assert_response :success
  end

end
