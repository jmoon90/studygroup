require 'spec_helper'

describe Message do
  it { should validate_presence_of :email }
  it { should validate_presence_of :description }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it 'sends an email when contact form is successfully submitted' do
    prev_mail_count = ActionMailer::Base.deliveries.count
    MessageConfirmation.content(FactoryGirl.build(:message))
    expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
  end
end
