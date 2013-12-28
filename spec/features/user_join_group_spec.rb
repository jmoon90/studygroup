require 'spec_helper'

feature 'Join group' do

  scenario 'join and leave present' do
    FactoryGirl.create(:group)
    visit root_path
    first(:link, 'Hartl').click
    expect(page).to have_content('Hartl')
  end

 # scenario 'join group' do
 #   #NEED TO REFACTOR
 #   @user = User.last
 #   @tutorial = Tutorial.last
 #   @group = FactoryGirl.create(:group)
 #   visit root_path

 #   click_on 'Hartl'
 #   click_on 'join'
 #   expect(page).to have_content(@user)
 # end
end
