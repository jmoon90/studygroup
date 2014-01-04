require 'spec_helper'

describe Group do
  it { should belong_to :tutorial }
  it { should have_many(:memberships).dependent(:destroy) }

  it { should have_many(:users) }
  it { should have_many(:users).through(:memberships) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :tutorial_id }

  it { should have_many(:posts).dependent(:destroy) }
end

