require 'spec_helper'

feature 'user view today I learned' do
  context 'A guest' do
    scenario 'view all learnings' do
      learning = FactoryGirl.create(:learning)
      learning2 = FactoryGirl.create(:learning, title: 'second learning')
      visit learnings_path

      expect(page).to have_content(learning.title)
      expect(page).to have_content(learning2.title)
    end
  end

  context 'user signed in' do
    given(:user) { FactoryGirl.create(:user) }
    before(:each) do
      log_in_user(user)
    end

    scenario 'with valid input' do
      visit new_learning_path
      fill_in 'Title', with: 'How to make TIL'
      fill_in 'Description', with: 'I went to reddit and saw how they did it and I magically knew'
      fill_in 'url', with: 'http://ryanfait.com/sticky-footer/'
      click_on 'submit'

     expect(page).to have_content('Yay learning is fun!')
    end

    scenario 'with invalid input' do
      visit new_learning_path
      click_on 'submit'

      expect(page).to have_content('Invalid input. Please try again')
    end

    scenario 'edit learning' do
      learning = FactoryGirl.create(:learning)
      visit edit_learning_path(learning)
      fill_in 'Title', with: 'I edit my TIL'
      click_on 'submit'

      expect(page).to have_content('Yay keep on learning!')
    end
  end

  context 'clicks on specific learning' do
    scenario "see's detail of learning" do
      learning = FactoryGirl.create(:learning)
      visit learning_path(learning)

      expect(page).to have_content learning.description
    end
  end
end
