require 'spec_helper'

describe Vote do
  it { should belong_to :user }
  it { should validate_uniqueness_of :user_id }
  it { should belong_to :learning }
end
