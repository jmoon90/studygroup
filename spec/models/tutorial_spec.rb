require 'spec_helper'

describe Tutorial do
  it { should validate_presence_of :name }
  it { should have_many :groups }
end
