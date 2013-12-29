require 'spec_helper'

feature 'Sign up' do
  before(:each) do
    visit new_user_registration_path
  end

  scenario 'with valid information' do
    within('form#new_user') do
      fill_in 'Email', with: 'jayleno@aol.com'
      fill_in 'Password', with: 'applepie'
      fill_in 'Password confirmation', with: 'applepie'
      click_button 'Sign up'
    end

    expect(page).to have_content('signed up successfully')
  end

  scenario 'with invalid information' do
    click_button 'Sign up'

    expect(page).to have_content('error')
  end
end
