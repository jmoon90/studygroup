require 'spec_helper'

feature Group do
  given(:user) { FactoryGirl.create(:user) }

  context 'not signed in' do
    scenario 'user must be signed in to create group' do
      visit new_group_path
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end

  context 'signed in' do
    before(:each) do
      log_in_user(user)
      Tutorial.create!(name: "Ruby Monk")
      visit new_group_path
    end

    scenario 'user can select a tutorial' do
      fill_in "Name", with: 'Pirates'
      select "Ruby Monk", from: "Tutorial"
      click_on 'Create group'

      page.should have_content('Success')
    end

    scenario 'invalid input' do
      click_on 'Create group'

      page.should have_content("can't be blank")
    end
  end
end
