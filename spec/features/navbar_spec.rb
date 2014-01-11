require 'spec_helper'

feature 'Navbar' do
context "user is signed in" do
  before(:each) do
    user = FactoryGirl.create(:user)
    log_in_user(user)
    visit root_path
  end
  scenario 'signed in user' do
    visit groups_path
    click_on "Pair Studying"
    expect(page).to have_content('Create New Group')
  end
end

  context "user isn't signed in" do
    scenario 'click logo' do
      visit new_user_session_path
      click_on "Pair Studying"

      expect(page).to have_content('Why Pair Studying')
    end

    scenario 'not signed in' do
      visit root_path

      expect(page).to have_content('Why Pair Studying')
    end
  end
end
