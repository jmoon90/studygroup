require 'spec_helper'

feature "Tutorial list" do
  before(:each) do
    visit new_tutorial_path
  end

  scenario 'valid inputs' do
    fill_in "Name", with: 'BoogyRails'
    click_button 'Add Tutorial'

    expect(page).to have_content("Added new tutorial")
  end

  scenario 'invalid inputs' do
    click_button('Add Tutorial')

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'tutorials form' do
    expect(page).to have_content("Add tutorial")
  end
end

