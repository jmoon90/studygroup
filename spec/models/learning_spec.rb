require 'spec_helper'

describe Learning do
  it { should validate_presence_of :title }
  it { should belong_to :user }
  it { should have_many :votes }

  describe '#has_vote_from' do
    it "is true if user voted for learning" do
      user = FactoryGirl.create(:user)
      learning = FactoryGirl.create(:learning, user: user)
      FactoryGirl.create(:vote, user: user, learning: learning)
      expect(learning.has_vote_from?(user)).to be_true
    end
  end
end
