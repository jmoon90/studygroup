require 'spec_helper'

describe Tag do
  it { should have_many :taggings }
  it { should have_many(:posts).through(:taggings) }
  it { should have_many(:comments).through(:taggings) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
end
