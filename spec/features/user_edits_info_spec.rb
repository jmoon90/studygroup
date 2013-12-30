require 'spec_helper'

feature 'Edit personal information' do
  given(:user) { FactoryGirl.create(:user) }
  given(:password_fill_in) {
    fill_in 'Password', with: 'cherrypie'
    fill_in 'Password confirmation', with: 'cherrypie'
  }

  before(:each) do
    log_in_user(user)
    visit edit_user_registration_path
  end

  context 'change password' do
    given(:update_button) { click_button 'Update' }

    before(:each) do
      password_fill_in
    end

    scenario 'password change' do
      fill_in 'Current password', with: 'applepie'
      update_button

      expect(page).to have_content('You updated your account successfully')
    end

    scenario 'incorrect current password' do
      update_button

      expect(page).to have_content("Current password can't be blank")
    end
  end

  scenario 'cancel account' do
    click_button 'Cancel my account'
    expect(page).to have_content('Bye!')
  end
end


