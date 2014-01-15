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
end
