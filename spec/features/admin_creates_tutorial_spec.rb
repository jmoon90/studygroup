require 'spec_helper'

feature "Tutorial list" do
  before(:each) do
    visit new_tutorial_path
  end
   given(:tutorial) { FactoryGirl.create(:tutorial) }
   given(:local_path) { File.join(Rails.root, '/spec/support/example.png') }

  scenario 'valid inputs' do

    fill_in "Name", with: 'BoogyRails'
    attach_file('tutorial_image', local_path)
    click_button 'Add Tutorial'

    expect(page).to have_content("Added new tutorial")
  end

  scenario 'invalid inputs' do
    click_button('Add Tutorial')

    expect(page).to have_content("Name can't be blank")
  end
end

