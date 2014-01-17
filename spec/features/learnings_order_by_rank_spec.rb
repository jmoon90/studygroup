require 'spec_helper'

feature 'Ranking' do
  scenario 'user visit learnings' do
    last = FactoryGirl.create(:learning, rank: 1, votes_count: 1)
    first = FactoryGirl.create(:learning, rank: 5, votes_count: 3, title: 'This is First')
    visit learnings_path

    page.body.index(first.title).should < page.body.index(last.title)
  end
end
