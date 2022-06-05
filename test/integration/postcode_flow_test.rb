require 'test_helper'

class PostcodeFlowTest < ActionDispatch::IntegrationTest
  test 'visiting the root shows the main page' do
    get '/'

    assert_select 'h1', text: 'Postcode'
  end

  test 'can see search results' do
    get '/search', params: { postcode: 'SE1 7QD' }

    assert_response :success
    assert_select 'p', text: /SE1 7QD/
  end
end
