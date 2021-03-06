require 'spec_helper'

feature 'User join group' do
  given(:group) { FactoryGirl.create(:group, size: 4) }
  given(:user) { FactoryGirl.create(:user) }

  before :each do
    log_in_user(user)
  end

  context 'Group not full' do
    before :each do
      visit group_path(group)
    end

    scenario 'user joining a group' do
      click_on "Join Group"

      expect(page).to have_content("Welcome to the group")
    end

    scenario 'user is part of the group' do
      click_on 'Join Group'

      expect(page).to_not have_content('Join Group')
    end

    scenario 'viewing new group' do
      expect(page).to_not have_content('Leave Group')
    end
  end

  scenario 'group is full' do
    4.times do
      FactoryGirl.create(:membership, group: group)
    end
    visit group_path(group)

    expect(page).to have_content("Full Group")
  end
end
