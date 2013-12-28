require 'spec_helper'

feature 'Navbar' do
  scenario 'signed in user' do
    FactoryGirl.create(:group)
    user = FactoryGirl.create(:user)
    sign_in(user)

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
