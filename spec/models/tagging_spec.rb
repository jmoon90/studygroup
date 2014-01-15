require 'spec_helper'

describe Tagging do
  it do
    FactoryGirl.create(:tagging)
    should validate_uniqueness_of(:taggable_id).scoped_to(:tag_id)
  end

  it { should belong_to :taggable }
  it { should belong_to :tag }

  it { should have_valid(:taggable_type).when('comment', 'post') }
end
