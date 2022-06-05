require 'application_system_test_case'

class PostcodeTest < ApplicationSystemTestCase
  test 'visiting the root shows the main page' do
    visit root_path

    assert_selector 'h1', text: 'Postcode'
  end

  test 'submitting the form shows the results page' do
    visit root_path

    fill_in 'Postcode', with: 'abc123'
    click_on 'Search'

    assert_text 'abc123'
  end

  test 'searching for a shippable postcode shows it is shippable' do
    visit root_path

    fill_in 'Postcode', with: 'SE1 7QD'
    click_on 'Search'

    assert_text 'SE1 7QD is shippable'
  end
end
