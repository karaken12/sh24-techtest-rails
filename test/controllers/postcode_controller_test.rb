require 'test_helper'

class PostcodeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
    assert_match 'Postcode', @response.body
  end
end
