require 'spec_helper'

feature Group do
  before :each do
    visit new_group_path
  end

  scenario 'user can create new group' do
    page.should have_selector(:link_or_button, 'Create group')
  end

  scenario 'user can select a tutorial' do
    page.should have_content('Please select')
  end

  scenario 'invalid input' do
    click_button 'Create group'
    page.should have_content("can't be blank")
  end
end
