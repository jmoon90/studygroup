require 'spec_helper'

feature 'Join group' do
  given!(:group) { FactoryGirl.create(:group) }
  scenario 'join and leave present' do
    visit root_path
    first(:link, 'Hartl').click
    expect(page).to have_content('join')
  end

  scenario 'join' do
    user = FactoryGirl.create(:user)

    sign_in(user)
    expect(page).to have_content(user.email)
  end

  scenario 'leave' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    first(:link, 'leave').click
    expect(page).to_not have_content(user.email)
  end

  def sign_in(user)
    visit root_path
    first(:link, 'Hartl').click
    log_in_user(user)
    first(:link, 'join').click
  end
end
