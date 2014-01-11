require 'spec_helper'

feature 'user visits about page' do
  scenario 'view content' do
    visit about_index_path

    expect(page).to have_content("Why")
  end
end

