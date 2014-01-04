require 'spec_helper'

feature 'user visits mygroup' do
  scenario 'user is not signed in' do
    visit root_path
    expect(page).to_not have_content("My Group")
  end

  context 'signed in to account' do
    given(:membership) { FactoryGirl.create(:membership) }
    before(:each) do
      log_in_user(membership.user)
      visit root_path
    end

    scenario 'views all group user is associated with' do
      click_on 'My Group'
      expect(page).to have_content(membership.group.name)
    end
  end
end
