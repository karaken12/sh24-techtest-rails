require 'test_helper'
# require 'minitest/mock'

class PostcodeCheckServiceTest < ActiveSupport::TestCase
  test 'should allow a postcode in Southwark' do
    service = PostcodeCheckService.new
    postcode = 'SE1 7QD'
    assert_equal(true, service.shippable?(postcode))
  end

  test 'should allow a postcode in Lambeth' do
    service = PostcodeCheckService.new
    postcode = 'SE1 7QA'
    assert_equal(true, service.shippable?(postcode))
  end

  test 'should not allow a postcode in York' do
    service = PostcodeCheckService.new
    postcode = 'YO10 5DD'
    assert_equal(false, service.shippable?(postcode))
  end
end
