require 'spec_helper'

describe Group do
  it { should belong_to :tutorial }
  it { should have_many :memberships }

  it { should have_many(:users) }
  it { should have_many(:users).through(:memberships) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :tutorial_id }

  describe "#seed_data" do
    it "joins user and group table" do
      Memberships::SEEDER
    end
  end

end

