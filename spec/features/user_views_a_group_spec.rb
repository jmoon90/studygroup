require 'spec_helper'

feature 'User views a group' do
  given(:user) { FactoryGirl.create(:user) }
  before :each do
    FactoryGirl.create(:tutorial)
    FactoryGirl.create(:group)
    visit root_path
    first(:link, 'Hartl').click
  end

  scenario "User see's all group infomation" do
    expect(page).to have_content("Hartl")
  end

  scenario "User see's other users in group" do
    log_in_user(user)
    click_on "join"
    expect(page).to have_content(user.email)
  end
end
