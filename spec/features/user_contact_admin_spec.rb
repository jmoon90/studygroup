require 'spec_helper'
feature 'site visitor wants to contact site staff' do
  scenario 'fills in form with valid information' do
    ActionMailer::Base.deliveries = []
    prev_count = Message.count
    visit new_message_path
    fill_in 'Email', with: 'random@gmail.com'
    fill_in 'Subject', with: 'Great Product'
    fill_in 'Description', with: 'Love the product, but how do you make money'
    fill_in 'First name', with: 'random'
    fill_in 'Last name', with: 'moon'
    click_on 'Create Message'

    expect(page).to have_content('Your message has been sent.')
    expect(Message.count).to eql(prev_count + 1)
    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Great Product')
    expect(last_email).to deliver_to('johnmoonyy@gmail.com')
  end

  scenario 'fills in form with invalid information' do
    visit new_message_path
    click_on 'Create Message'

    expect(page).to have_content('Invalid information. Please try again.')
  end
end
