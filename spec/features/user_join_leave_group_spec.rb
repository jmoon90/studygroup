require 'spec_helper'

feature 'Join or leave group' do
  given!(:group) { FactoryGirl.create(:group) }
  given(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in(user)
  end

  scenario 'join' do
    expect(page).to have_content(user.email)
  end

  scenario 'successful join message' do
    expect(page).to have_content("Welcome to the group")
  end

  scenario 'leave' do
    first(:link, 'leave').click
    expect(page).to_not have_content(user.email)
  end

  scenario 'successful leave message' do
    first(:link, 'leave').click
    expect(page).to have_content("Sorry to see you leave")
  end
end
