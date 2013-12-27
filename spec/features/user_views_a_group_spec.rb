require 'spec_helper'

feature 'User views a group' do
  scenario "User see's all group infomation" do
    group = FactoryGirl.create(:group)

    visit root_path
    click_on group.name

    expect(page).to have_content(group.name)
    expect(page).to have_content(group.tutorial.name)
  end
end
