require 'spec_helper'

feature 'User leaves group' do

  before :each do
    user = FactoryGirl.create(:user)
    group = FactoryGirl.create(:group)

    log_in_user(user)
    visit group_path(group)
    click_on 'Join Group'
  end

  scenario 'user leaves group' do
    click_on 'Leave Group'
    expect(page).to have_content("Sorry to see you leave")
  end

  scenario 'sees join group button' do
    click_on 'Leave Group'
    expect(page).to have_button("Join Group")
  end
end
