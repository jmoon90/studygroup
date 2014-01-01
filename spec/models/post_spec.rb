require 'spec_helper'

describe Post do
  it { should validate_presence_of :description }
  it { should validate_presence_of :title }

  it { should belong_to(:user) }
  it { should belong_to(:group) }
  it { should have_many(:comments) }
end
