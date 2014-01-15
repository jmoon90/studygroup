require 'spec_helper'

describe Post do
  it { should validate_presence_of :description }
  it { should validate_presence_of :title }

  it { should belong_to(:user) }
  it { should belong_to(:group) }

  it { should have_many(:comments) }
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:tags).through(:taggings) }

  describe "#tag_list=" do
    let(:post) { FactoryGirl.create(:post) }

    it "builds an associated tag" do
      post.tag_list=("cute")
      post.save

      expect(post.tags.pluck(:name)).to include "cute"
    end

    it "builds multiple associated tags" do
      post.tag_list = "cute,pretty, banana"
      post.save
      tags = post.tags.pluck(:name)

      expect(tags).to include "cute"
      expect(tags).to include "pretty"
      expect(tags).to include "banana"
    end
  end
end

