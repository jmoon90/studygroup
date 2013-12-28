require 'spec_helper'

feature 'User views a group' do
  scenario "User see's all group infomation" do
    group = FactoryGirl.create(:group)

    #Could not visit root and click 
    visit groups_path(group.id)
    expect(page).to have_content(group.name)
  end
end
