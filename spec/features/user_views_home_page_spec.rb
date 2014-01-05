require 'spec_helper'

feature 'user visit home page' do
  given(:group) { FactoryGirl.create(:group, name: 'hartl') }

  scenario 'sort by most amount of users' do
    tutorial = FactoryGirl.create(:tutorial, name: 'mu', id: 16, image: nil)

    group1 = FactoryGirl.create(:group, name: 'monsu', id: 16, tutorial_id: tutorial.id)
    2.times do
      FactoryGirl.create(:membership, group: group)
    end
    FactoryGirl.create(:membership, group: group1)

    visit root_path
    within(".f-dropdown") do
      click_on 'Most Users'
    end

    page.body.index('hartl').should < page.body.index('monsu')
  end

  scenario 'sort by least amount of users' do
    tutorial = FactoryGirl.create(:tutorial, name: 'mu', id: 16, image: nil)
    group1 = FactoryGirl.create(:group, name: 'monsu', id: 16, tutorial_id: tutorial.id)

    2.times do
      FactoryGirl.create(:membership, group: group)
    end
    FactoryGirl.create(:membership, group: group1)

    visit root_path
    within(".f-dropdown") do
      click_on 'Least Users'
    end

    page.body.index('monsu').should < page.body.index('hartl')
  end

  scenario 'view groups current member size against max memeber size' do
    2.times do
      FactoryGirl.create(:membership, group: group)
    end
    visit root_path

    expect(page).to have_content('2 / 12')
  end

  scenario 'sort full groups to the top' do
  end

end
