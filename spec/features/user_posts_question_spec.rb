require 'spec_helper'

feature 'Group member post' do
  given!(:membership) { FactoryGirl.create(:membership) }

  before(:each) do
    visit group_path(membership.group)
    log_in_user(membership.user)
    click_on 'Join Group'
    click_on 'Create Post'
  end

  scenario 'with valid information' do
    fill_in "Title", with: 'Silly'
    fill_in "Description", with: 'Willy'
    fill_in 'Tag list', with: 'Ch 1'

    click_on "Post"

    expect(page).to have_content("Successfully posted to post")
    expect(Tagging.last.taggable_type).to have_content('Post')
    expect(Post.last.tags).not_to be_empty
  end

  scenario 'with invalid information' do
    click_on "Post"

    expect(page).to have_content("There was an error. Please try again.")
  end

  scenario 'view submitted post in the group' do
    fill_in "Title", with: 'Silly'
    fill_in "Description", with: 'Willy'
    fill_in 'Tag list', with: 'Ch 1'

    click_on 'Post'


    expect(page).to have_content("Successfully posted to post")
    expect(page).to have_content('Silly')
  end
end

