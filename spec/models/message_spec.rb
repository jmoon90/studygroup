require 'spec_helper'

describe Message do
  it { should validate_presence_of :email }
  it { should validate_presence_of :description }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
end
