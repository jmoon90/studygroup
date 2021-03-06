require 'spec_helper'

feature 'user visit post' do
  given(:comment) { FactoryGirl.create(:comment) }

  scenario 'valid input' do
    log_in_user(comment.user)
    visit post_path(comment.post)
    fill_in 'Your Answer', with: comment.answer
    click_on 'Post Your Answer'

    expect(page).to have_content(comment.answer)
    expect(page).to_not have_content('No answers yet')
  end

  scenario 'invalid input' do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)

    log_in_user(user)
    visit post_path(post)
    click_on 'Post Your Answer'

    page.should have_content("There was an error")
  end

  scenario 'views page with no comments' do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    expect(page).to have_content('No answers yet')
  end

  scenario 'views tag for post' do
    post = FactoryGirl.create(:post)
    tag = FactoryGirl.create(:tag)
    FactoryGirl.create(:tagging, taggable_id: post.id, taggable_type: 'Post', tag_id: tag.id)
    visit post_path(post)
    expect(page).to have_link(tag.name)
  end

  scenario 'views page with comments' do
    visit post_path(comment.post)
    expect(page).to_not have_content('No answers yet')
  end
end
