require 'spec_helper'

describe Group do
  it { should belong_to :tutorial }
  it { should have_many :memberships }

  it { should have_many(:users) }
  it { should have_many(:users).through(:memberships) }
end
