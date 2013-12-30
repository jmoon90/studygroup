require 'spec_helper'

describe User do
  it { should have_many(:groups) }
  it { should have_many(:groups).through(:memberships) }

  it { should have_many(:memberships).dependent(:destroy) }
end

