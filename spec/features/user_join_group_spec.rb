require 'spec_helper'

feature 'Join group' do
  scenario 'join and leave present' do
    FactoryGirl.create(:group)
    visit root_path
    first(:link, 'Hartl').click
    expect(page).to have_content('join')
  end

  scenario 'join group' do
    FactoryGirl.create(:group)
    FactoryGirl.create(:membership)
    user = FactoryGirl.create(:user)

    visit root_path
    first(:link, 'Hartl').click
    log_in_user(user)
    first(:link, 'join').click
    expect(page).to have_content(user.email)
  end
end
