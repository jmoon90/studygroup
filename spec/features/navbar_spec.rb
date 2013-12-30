require 'spec_helper'

feature 'Navbar' do
  scenario 'signed in user' do
    user = FactoryGirl.create(:user)
    log_in_user(user)
    visit root_path

    expect(page).to have_content('Profile')
  end

  scenario 'not signed in' do
    visit root_path

    expect(page).to have_content('Sign In')
  end

  scenario 'click logo' do
    visit new_user_session_path
    click_on "Pair Studying"

    expect(page).to have_content('Create New Group')
  end
end
