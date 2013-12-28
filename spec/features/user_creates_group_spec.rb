require 'spec_helper'

feature Group do
  scenario 'user can create new group' do
    visit new_group_path
    expect(page).to have_selector(:link_or_button, 'Create group')
  end

  scenario 'user can select a tutorial' do
    visit new_group_path
    expect(page).to have_content('Please select')
  end

  scenario 'invalid input' do
    visit new_group_path
    click_button 'Create group'
    expect(page).to have_content("can't be blank")
  end
end
