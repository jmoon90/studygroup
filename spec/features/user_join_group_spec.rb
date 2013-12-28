require 'spec_helper'

feature 'Join group' do
  scenario 'join and leave present' do
    #NEED TO REFACTOR AND FIX BROKEN TEST. I THINK IT"S BC THE OLD POST
    #WITHOUT RELATIONSHIPS 
    visit root_path
    @user = User.last
    @tutorial = Tutorial.last
    @group = Group.create!(tutorial_id: @tutorial.id, name: 'Rails Tutorial')

    click_on 'Hartl'
    expect(page).to have_content('Hartl')
  end

  scenario 'join group' do
    #NEED TO REFACTOR
    @user = User.last
    @tutorial = Tutorial.last
    @group = FactoryGirl.create(:group)
    visit root_path

    click_on 'Hartl'
    click_on 'join'
    expect(page).to have_content(@user)
  end
end
