require 'test_helper'

class PostcodeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
    assert_match 'Postcode', @response.body
  end

  test 'should show a basic form' do
    get root_url
    assert_select 'form', { count: 1 } do |elements|
      form_element = elements[0]
      assert_equal('/search', form_element['action'])
      assert_equal('get', form_element['method'])

      assert_select 'input', { count: 2 } do |inputs|
        assert_equal('text', inputs[0]['type'])
        assert_equal('submit', inputs[1]['type'])
      end
    end
  end
end
