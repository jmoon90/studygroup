require 'spec_helper'

feature 'Sign out' do
  before(:each) do
    user = FactoryGirl.create(:user)
    log_in_user(user)
    visit root_path
  end

  scenario 'when signed in' do
    expect(page).to have_content ('Sign out')
  end

  scenario 'the user' do
    click_link "Sign out"
    expect(page).to have_content ('Sign In')
  end
end
