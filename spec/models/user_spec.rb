require 'spec_helper'

describe User do
  it { should have_many(:groups) }
  it { should have_many(:groups).through(:memberships) }
  it { should have_many(:memberships).dependent(:destroy) }
  it { should have_many(:posts).dependent(:nullify) }
  it { should have_many(:comments).dependent(:nullify) }
end

