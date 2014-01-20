class Learning < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user,
    inverse_of: :learnings
  has_many :votes,
    dependent: :destroy,
    inverse_of: :learning

  def has_vote_from?(user)
    votes.find_by(user_id: user.id).present?
  end

  def vote_from(user)
    votes.find_by(user_id: user.id)
  end

  def self.highest_rank
    Learning.order(rank: :desc)
  end

  def self.filter_by(object)
    object = 'highest_rank' if object.nil?
    send(object)
  end

  def self.rank_learning(learning, like)
    created_at = (learning.created_at.strftime "%H").to_f
    like = 1 if like < 2
    rank = (like-1) / ((created_at + 2) **1.5)
    learning.rank = rank
    learning.save
  end
end
