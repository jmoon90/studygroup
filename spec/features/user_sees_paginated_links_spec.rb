require 'spec_helper'

feature 'Views TIL page' do
  scenario 'only views 2 posts out of 3' do
    11.times do
      FactoryGirl.create(:learning)
    end

    visit learnings_path
    expect(page).to have_content("Next")
  end
end
