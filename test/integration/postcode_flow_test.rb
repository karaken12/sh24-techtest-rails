require 'test_helper'

class PostcodeFlowTest < ActionDispatch::IntegrationTest
  test 'visiting the root shows the main page' do
    get '/'

    assert_select 'h1', text: 'Postcode'
  end
end
