require 'spec_helper'

describe Membership do
  it { should belong_to(:user) }
  it { should belong_to(:group) }

  it { should have_valid(:user_id).when(User.new) }
  it { should have_valid(:group_id).when(Group.new) }

  describe "#seeder" do
    it "joins user and group table" do
      group = [{group_id: 1}]
      Membership.seeder(group)
      expect(Membership.all).should_not be_empty
    end
    it "joins user and group table" do
      user = [{user_id: 1}]
      Membership.seeder(user)
      expect(Membership.all).should_not be_empty
    end

  end
end
