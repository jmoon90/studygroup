require 'spec_helper'

feature 'user visits page for the first time' do
  scenario "see's landing page" do
    visit home_index_path
    expect(page).to have_content('Learn _____ better,together.')
  end

  scenario 'sign up for account' do
    visit home_index_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on "Sign up"
    expect(page).to have_content('signed up successfully')
  end
end

