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
end
