require 'spec_helper'

feature 'Join or leave group' do
  given!(:group) { FactoryGirl.create(:group) }
  given(:user) { FactoryGirl.create(:user) }
  given(:join) { first(:link, 'join').click }
  given(:leave) { first(:link, 'leave').click }

  before :each do
    sign_in(user)
  end

  scenario 'join' do
    join
    expect(page).to have_content(user.email)
    expect(page).to have_content("Welcome to the group")
  end

  scenario 'viewing joined group' do
    join
    expect(page).to_not have_content('join')
  end

  scenario 'leave' do
    join
    leave
    expect(page).to_not have_content(user.email)
    expect(page).to have_content("Sorry to see you leave")
  end

  scenario 'viewing new group' do
    expect(page).to_not have_content('leave')
  end
end
