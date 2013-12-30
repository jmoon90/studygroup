require 'spec_helper'

feature 'Join or leave group' do
  given!(:group) { FactoryGirl.create(:group) }
  given(:user) { FactoryGirl.create(:user) }
  given(:user1) { FactoryGirl.create(:user) }
  given(:user2) { FactoryGirl.create(:user) }
  given(:join) { first(:link, 'join').click }
  given(:leave) { first(:link, 'leave').click }

  before :each do
    sign_in(user)
  end

  scenario 'join group less than 2' do
    join
    expect(page).to have_content(user.email)
    expect(page).to have_content("Welcome to the group")
  end

 # scenario 'join group with maxed limit' do
 #   # HOW DO YOU WRITE TEST TO SEE IF THERE ARE ALREADY 2 PEOPL IN THE
 #   # DATA BASE
 #   #Membership.find_or_create_by(group_id: group.id, user_id: user.id)
 #   #Membership.find_or_create_by(group_id: group.id, user_id: user1.id)
 #   expect(page).to have_content(user1.email)
 #   expect(page).to have_content(user.email)
 # end

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
