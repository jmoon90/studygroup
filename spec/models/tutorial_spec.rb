require 'spec_helper'

describe Tutorial do
  it { should validate_presence_of(:name) }

  it do
    should validate_uniqueness_of(:name).case_insensitive
  end

  it { should have_many :groups }
end
