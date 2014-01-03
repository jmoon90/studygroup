require 'spec_helper'

describe Group do
  it { should belong_to :tutorial }

  it { should have_many(:memberships).dependent(:destroy) }
  it { should have_many(:users).through(:memberships) }
  it { should have_many(:users) }
  it { should have_many(:posts) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :tutorial_id }
  it { should validate_presence_of :size }
  it { should validate_numericality_of(:size).is_less_than_or_equal_to(12) }
end

