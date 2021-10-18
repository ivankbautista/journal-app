require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test "user should be able to create categories" do
    sign_in users(:ivan)
    get new_category_path
    assert_response :success

    post categories_path, params: { category: { title: "Work" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Work"
  end

  test "" do
    # user story #2 here
  end
end
