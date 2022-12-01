require 'test_helper'

class ViewsControllerTest < ActionDispatch::IntegrationTest
  test 'should get shops' do
    get views_shops_url
    assert_response :success
  end
end
