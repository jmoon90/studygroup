require 'spec_helper'

feature 'Sign out' do
  before(:each) do
    FactoryGirl.create(:user)
    visit new_user_session_path


    fill_in "Email", with: 'j@aol.com'
    fill_in "Password", with: 'applepie'

    click_button 'Sign in'
  end

  scenario 'when signed in' do
    expect(page).to have_content ('Sign out')
  end

  #scenario 'the user' do
  #    within('.sign_out_user') do
  #      click_link "Sign out"
  #    end
  #  expect(page).to have_content ('Are you sure?')
  #end

end
