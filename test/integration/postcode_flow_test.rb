require 'test_helper'

class PostcodeFlowTest < ActionDispatch::IntegrationTest
  test 'visiting the root shows the main page' do
    get '/'

    assert_select 'h1', text: 'Postcode'
  end

  test 'can see search results' do
    get '/search', params: { postcode: 'abc123' }

    assert_response :success
    assert_select 'p', text: /abc123/
  end
end
