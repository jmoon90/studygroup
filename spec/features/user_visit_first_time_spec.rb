require 'spec_helper'

feature 'user visits page for the first time' do
  scenario "see's landing page" do
    visit home_index_path
    expect(page).to have_content('Learn _____ better, together')
  end
end

