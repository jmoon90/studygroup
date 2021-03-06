require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:answer) }
  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:user) }

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:tags).through(:taggings) }
end
