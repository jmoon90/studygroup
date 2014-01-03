require 'spec_helper'

feature 'user visit home page' do
  given(:group) { FactoryGirl.create(:group) }

  scenario 'sort not full groups to the top' do
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)

    visit root_path
    click_on sort_unfull

  end

  scenario 'view groups current member size against max memeber size' do
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)
    FactoryGirl.create(:membership, group: group)
    visit root_path

    expect(page).to have_content('3/12')
  end

  scenario 'sort full groups to the top' do
  end

end
