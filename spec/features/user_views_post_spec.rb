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
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on 'Post Your Answer'

    within('#notice.alert-box') do
      expect(page).to have_content('There was an error')
    end
  end

  scenario 'views page with no comments' do
    post = FactoryGirl.create(:post)
    visit post_path(post)
    expect(page).to have_content('No answers yet')
  end

  scenario 'views page with comments' do
    visit post_path(comment.post)
    expect(page).to_not have_content('No answers yet')
  end
end
