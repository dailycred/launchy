require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "login with email" do
    visit '/'

    fill_in "email", with: 'hank@2.com'
    fill_in "pass", with: 'password'
    click_button "signup-btn"
    wait_until { find('.thanks') }
    assert_equal current_path, '/thanks'
  end
end
