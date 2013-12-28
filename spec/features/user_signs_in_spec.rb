require 'spec_helper'

feature 'Sign in' do
  before(:each) do
    visit new_user_session_path
    FactoryGirl.create(:user)
  end

  scenario 'with valid information' do
    fill_in 'Email', with: 'j@aol.com'
    fill_in 'Password', with: 'applepie'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with invalid information' do
    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end
end
