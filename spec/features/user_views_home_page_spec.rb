require 'spec_helper'

feature 'user visit home page' do
  given(:group) { FactoryGirl.create(:group, name: 'hartl') }

  scenario 'sort not full groups to the top' do
    tutorial = FactoryGirl.create(:tutorial, name: 'mu', id: 16, image: nil)
    group1 = FactoryGirl.create(:group, name: 'monsu', id: 16, tutorial_id: tutorial.id)
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group1)

    visit root_path
#    save_and_open_page
    click_on 'sort by size'

    page.should have_tag("li:first-child", text: 'hartl')
  end

  scenario 'view groups current member size against max memeber size' do
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)
    visit root_path

    expect(page).to have_content('3 / 12')
  end

  scenario 'sort full groups to the top' do
  end

end
