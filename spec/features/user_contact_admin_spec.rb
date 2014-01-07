require 'spec_helper'

#As a site visitor
#I want to contact the site's staff
#So that I can ask questions or make comments about the site

#Acceptance Criteria:

#I must specify a valid email address
#I must specify a subject
#I must specify a description
#I must specify a first name
#I must specify a last name


feature 'site visitor wants to contact site staff' do
  scenario 'fills in form with valid information' do
    visit new_message_path
    fill_in 'Email', with: 'random@gmail.com'
    fill_in 'Subject', with: 'How do you make money?'
    fill_in 'Description', with: 'Love the product, but how do you make money'
    fill_in 'First name', with: 'random'
    fill_in 'Last name', with: 'moon'
    click_on 'Create Message'

    expect(page).to have_content('Your message has been sent.')
  end

  scenario 'fills in form with invalid information' do
    visit new_message_path
    click_on 'Create Message'

    expect(page).to have_content('Invalid information. Please try again.')
  end
end
