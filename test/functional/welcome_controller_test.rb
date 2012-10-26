require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should redirect to home when unauthenticated" do
    get :thanks
    assert_redirected_to home_path
  end

  test "should redirect to /thanks when authenticated" do
    log_in
    get :home
    assert_redirected_to thanks_path
  end

  test "should success to thanks when authenticated" do
    log_in
    get :thanks
    assert_response :success
  end

  private

  def log_in
    @controller.stubs(:current_user).returns build(:user)
  end

end
