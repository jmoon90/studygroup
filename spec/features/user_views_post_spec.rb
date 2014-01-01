require 'spec_helper'

feature 'user visit post' do
  given(:comment) { FactoryGirl.create(:comment) }

  scenario 'valid input' do
    visit post_path(comment.post)
    fill_in 'Your Answer', with: comment.answer
    click_on 'Post Your Answer'

    expect(page).to have_content(comment.answer)
  end

  scenario 'invalid input' do
    visit post_path(comment.post)
    click_on 'Post Your Answer'

    page.should have_selector('#notice')
  end

  scenario 'views page' do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    expect(page).to have_content('No answers yet')
  end
end
