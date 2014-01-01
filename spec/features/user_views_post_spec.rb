require 'spec_helper'

feature 'user visit post' do
  given(:post) { FactoryGirl.create(:post) }
  scenario 'write comment' do

    visit post_path(post)
    click_on new_comment_path
    fill_in 'Comment', comment.body
    click 'Post Your Answer'

    expect(page).to have_content(comment.body)
  end

  scenario 'write comment' do
    visit post_path(post)
    click_on new_comment_path
    click 'Post Your Answer'

    expect(page).to have_content('There was an error')
  end

  scenario 'visit page' do
    visit post_path(post)
    click_on new_comment_path
    expect(page).to have_content(Post.title)
    expect(page).to have_content(Post.description)
  end

end
