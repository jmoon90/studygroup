require 'spec_helper'

feature "User views group" do
  scenario 'that the user is a part of' do
    membership = FactoryGirl.create(:membership)
    log_in_user(membership.user)
    visit mygroup_groups_path

    expect(page).to have_content(membership.group.name)
  end

  scenario 'and sees user email' do
    membership = FactoryGirl.create(:membership)
    log_in_user(membership.user)
    visit mygroup_groups_path

    expect(page).to have_content(membership.user.email)
  end
end
