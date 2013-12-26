require 'spec_helper'

feature 'Edit personal information' do
  before(:each) do
    visit new_user_session_path
    FactoryGirl.create(:user)
    fill_in 'Email', with: 'j@aol.com'
    fill_in 'Password', with: 'applepie'

    click_button 'Sign in'
    visit edit_user_registration_path
  end

  scenario 'password change' do
    fill_in 'Password', with: 'cherrypie'
    fill_in 'Password confirmation', with: 'cherrypie'
    fill_in 'Current password', with: 'applepie'

    click_button 'Update'

    expect(page).to have_content('You updated your account successfully')
  end

  scenario 'cancel account' do
    click_button 'Cancel my account'

    visit new_user_session_path
    fill_in 'Email', with: 'j@aol.com'
    fill_in 'Password', with: 'applepie'

    click_button 'Sign in'
    expect(page).to have_content('Invalid email or password')
  end
end


