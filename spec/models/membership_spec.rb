require 'spec_helper'

describe Membership do
  it { should belong_to(:user) }
  it { should belong_to(:group) }

  it { should have_valid(:user_id).when(User.new) }
  it { should have_valid(:group_id).when(Group.new) }

  describe "#seeder" do
    membership = FactoryGirl.create(:membership)
    it "joins user and group table" do
      group = membership.group_id
      user = membership.user_id
      args = { group: group, user: user }

      Membership.seeder(args)
      expect(Membership.all).should_not be_empty
    end
  end
end
