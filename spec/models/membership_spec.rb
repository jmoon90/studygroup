require 'spec_helper'

describe Membership do
  it { should belong_to(:user) }
  it { should belong_to(:group) }

  it { should have_valid(:user_id).when(User.new) }
  it { should have_valid(:group_id).when(Group.new) }

  describe "#seeder" do
    it "joins user and group table" do
      group = FactoryGirl.create(:group)
      user = FactoryGirl.create(:user)
      #IF MembershipController create method changes, this will still
      #pass
      @membership = Membership.find_or_create_by(user_id: user.id, group_id: group.id)

      expect(Membership.all).should_not be_empty
    end
  end
end
