require 'test_helper'
require 'minitest/mock'

class PostcodeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_url
    assert_response :success
    assert_match 'Postcode', @response.body
  end

  test 'index should show a basic form' do
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

  test 'search should show supplied postcode' do
    mock = Minitest::Mock.new
    mock.expect :shippable?, true, ['abc123']

    PostcodeCheckService.stub :new, mock do
      get '/search', params: { postcode: 'abc123' }
      assert_select 'p', { text: /abc123/ }
    end
  end

  test 'search should show a shippable postcode is shippable' do
    mock = Minitest::Mock.new
    mock.expect :shippable?, true, ['abc123']

    PostcodeCheckService.stub :new, mock do
      get '/search', params: { postcode: 'abc123' }
      assert_select 'p', { text: /is shippable/ }
    end

    assert_mock mock
  end

  test 'search should show an unshippable postcode is not shippable' do
    mock = Minitest::Mock.new
    mock.expect :shippable?, false, ['abc456']

    PostcodeCheckService.stub :new, mock do
      get '/search', params: { postcode: 'abc456' }
      assert_select 'p', { text: /is not shippable/ }
    end

    assert_mock mock
  end
end
