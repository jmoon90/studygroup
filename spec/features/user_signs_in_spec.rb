require 'spec_helper'

feature 'Sign in' do
    given(:user) { FactoryGirl.create(:user) }
  before(:each) do
    visit new_user_session_path
  end

  scenario 'with valid information' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'with invalid information' do
    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end
end
