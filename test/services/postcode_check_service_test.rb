require 'test_helper'

class PostcodeCheckServiceTest < ActiveSupport::TestCase
  setup do
    @service = PostcodeCheckService.new
  end

  test 'should allow a postcode in Southwark' do
    assert_equal(true, @service.shippable?('SE1 7QD'))
  end

  test 'should allow a postcode in Lambeth' do
    assert_equal(true, @service.shippable?('SE1 7QA'))
  end

  test 'should not allow a postcode in York' do
    assert_equal(false, @service.shippable?('YO10 5DD'))
  end

  test 'should allow explicitly added postcodes' do
    assert_equal(true, @service.shippable?('SH24 1AA'))
  end

  test 'should allow badly formatted postcodes' do
    assert_equal(true, @service.shippable?('   Se17qD   '))
    assert_equal(true, @service.shippable?("sE1\t7Qa\n"))
    assert_equal(true, @service.shippable?(' s H 2 4 1 A A '))
  end

  test 'should not allow invalid postcodes' do
    assert_equal(false, @service.shippable?(''))
    assert_equal(false, @service.shippable?('invalid'))
  end
end
