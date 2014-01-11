require 'spec_helper'

feature 'user visit tips page' do
  scenario 'view information' do
    visit tips_path

    expect(page).to have_content('Tips')
  end
end
