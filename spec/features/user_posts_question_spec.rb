require 'spec_helper'

feature 'Group member post' do

  scenario 'valid information' do
    post = FactoryGirl.create(:post)
    visit new_post_path
    fill_in "Title", with: post.title
    fill_in "Description", with: post.description
    click_on "Post"

    expect(page).to have_content("Successfully posted to post")
  end

  scenario 'valid information' do
    visit new_post_path
    click_on "Post"

    expect(page).to have_content("There was an error. Please try again.")
  end
end

