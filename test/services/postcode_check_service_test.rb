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

  test 'should allow explicitly added postcodes' do
    service = PostcodeCheckService.new
    postcode = 'SH24 1AA'
    assert_equal(true, service.shippable?(postcode))
  end

  test 'should allow badly formatted postcodes' do
    service = PostcodeCheckService.new
    postcode = '   Se17qD   '
    assert_equal(true, service.shippable?(postcode))
    postcode = "sE1\t7Qa\n"
    assert_equal(true, service.shippable?(postcode))
    postcode = ' s H 2 4 1 A A '
    assert_equal(true, service.shippable?(postcode))
  end

  test 'should not allow invalid postcodes' do
    service = PostcodeCheckService.new
    postcode = ''
    assert_equal(false, service.shippable?(postcode))
    postcode = 'invalid'
    assert_equal(false, service.shippable?(postcode))
  end
end
