require 'spec_helper'

feature 'user votes' do
  context 'as a guest' do
    scenario 'clicks vote button' do
      FactoryGirl.create(:learning)
      visit learnings_path
      first(:link, 'like').click

      expect(page).to have_content("you'll need to login or register to do that")
    end
  end

  context 'as signed in user'do
    before(:each) do
      learning = FactoryGirl.create(:learning)
      log_in_user(learning.user)
      visit learnings_path
    end

    scenario 'clicks vote button' do
      vote_count = Vote.all.count
      click_on 'like'

      expect(page).to have_button('1 unlike')
      expect(vote_count + 1).to eql(Vote.all.count)
    end

    scenario 'who voted on a learning' do
      click_on 'like'

      expect(page).to have_content('We heard your hearts vote')
      expect(page).to have_button('unlike')
    end

    scenario 'unvote on a learning' do
      click_on 'like'
      click_on 'unlike'

      expect(page).to have_button('like')
      expect(page).to have_content('We heard the swaying of your heart')
    end
  end
end
