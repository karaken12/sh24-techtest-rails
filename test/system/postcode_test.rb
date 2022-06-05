require 'application_system_test_case'

class PostcodeTest < ApplicationSystemTestCase
  test 'visiting the root shows the main page' do
    visit root_path

    assert_selector 'h1', text: 'Postcode'
  end
end
