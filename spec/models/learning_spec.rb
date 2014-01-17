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

    it 'should rank based on  posted time and amount of likes' do
      second = FactoryGirl.create(:learning)
      third = FactoryGirl.create(:learning, rank: 1)
      first = FactoryGirl.create(:learning, rank: 5)

      expect(Learning.order(rank: :desc)).to eq([first, second, third])
    end
  end
end
