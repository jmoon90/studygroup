require 'spec_helper'

feature 'Group member post' do
  given!(:membership) { FactoryGirl.create(:membership) }

  before(:each) do
    visit group_path(membership.group)
    log_in_user(membership.user)
    click_on 'Join Group'
    click_on 'Create Post'
  end

  scenario 'valid information' do
    fill_in "Title", with: 'Silly'
    fill_in "Description", with: 'Willy'
    fill_in 'Tag', with: 'Ch 1'

    click_on "Post"

    expect(page).to have_content("Successfully posted to post")
  end

  scenario 'invalid information' do
    click_on "Post"

    expect(page).to have_content("There was an error. Please try again.")
  end

  scenario 'view submitted post in the group' do
    fill_in "Title", with: 'Silly'
    fill_in "Description", with: 'Willy'
    click_on "Post"

    expect(page).to have_content("Successfully posted to post")
  end
end

