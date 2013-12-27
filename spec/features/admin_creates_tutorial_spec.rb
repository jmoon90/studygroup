require 'spec_helper'

feature "Tutorial list" do
  scenario 'valid inputs' do
    visit new_tutorial_path

    fill_in "Name", with: 'Rails tutorial'
    click_button('Add Tutorial')
    expect(page).to have_content("Added new tutorial")
  end
  scenario 'invalid inputs' do
    visit new_tutorial_path

    click_button('Add Tutorial')
    expect(page).to have_content("Name can't be blank")
  end
  scenario 'tutorials form' do
    visit new_tutorial_path

    expect(page).to have_content("Add tutorial")
  end
end

