require 'spec_helper'

describe Membership do
  it { should belong_to(:user) }
  it { should belong_to(:group) }

  it { should have_valid(:user_id).when(User.new) }
  it { should have_valid(:group_id).when(Group.new) }
end
