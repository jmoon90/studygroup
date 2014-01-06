require 'spec_helper'

feature 'User in group' do
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
      Tutorial.create!(name: 'Ruby Monk')
      visit new_group_path
    end

    scenario 'user can select a tutorial' do
      fill_in 'Name', with: 'Pirates'
      fill_in 'Size', with: 12
      select "Ruby Monk", from: 'Tutorial'
      click_on 'Create group'

      page.should have_content('Created group successfully')
    end

    scenario 'invalid input' do
      click_on 'Create group'

      page.should have_content("can't be blank")
    end

    scenario 'invalid size' do
      fill_in 'Name', with: 'Pirates'
      fill_in 'Size', with: 13
      select 'Ruby Monk', from: 'Tutorial'
      click_on 'Create group'

      page.should have_content("must be less than or equal to 12")
    end
  end
end
