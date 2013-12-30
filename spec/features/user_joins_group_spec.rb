require 'spec_helper'

feature 'User join group' do
  given(:group) { FactoryGirl.create(:group) }
  given(:user) { FactoryGirl.create(:user) }

  def join_group
    first(:link, 'Join Group').click
  end

  before :each do
    log_in_user(user)
  end

  scenario 'user joining a group' do
    visit group_path(group)
    click_on "Join Group"

    expect(page).to have_content("Welcome to the group")
  end

  scenario 'group is full' do
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)

    visit group_path(group)

    expect(page).to have_content("Full Group")
  end

  scenario 'viewing joined group' do
    join_group

    expect(page).to_not have_content('join')
  end

  scenario 'viewing new group' do
    expect(page).to_not have_content('leave')
  end
end
