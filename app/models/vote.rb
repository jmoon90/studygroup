class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id
  belongs_to :user,
    inverse_of: :votes
  belongs_to :learning,
    counter_cache: true,
    inverse_of: :votes
end
