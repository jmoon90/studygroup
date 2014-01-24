require 'spec_helper'

feature 'user sort group' do
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    log_in_user(user)
  end

  scenario 'based on tutorial' do
    tutorial = FactoryGirl.create(:tutorial, name: 'Ruby Monk')
    ruby_monk = FactoryGirl.create(:group, name: 'John Moon Fail', tutorial_id: tutorial.id)
    rails_tutorial = FactoryGirl.create(:group)
    visit groups_path
    select 'Rails Tutorial', from: 'tutorial'
    click_on 'Sort', exact: true

    expect(page).to_not have_content(ruby_monk.name)
    expect(page).to have_content(rails_tutorial.name)
  end
end
