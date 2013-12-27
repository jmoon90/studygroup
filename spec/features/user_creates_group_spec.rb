require 'spec_helper'

feature Group do
  scenario 'user can create new group' do
    visit new_group_path
    expect(page).to have_selector(:link_or_button, 'Create group')
  end

  scenario 'user can select a tutorial' do
    visit new_group_path
    expect(page).to have_content('Ruby monk')
  end

  scenario 'flash success message' do
    visit new_group_path
    fill_in 'Name', with: "Golum"
    fill_in 'Tutorial', with: "rails tutorial"

    click_button 'Create group'
    expect(page).to have_content('Success')
  end
end
