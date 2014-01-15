class Vote < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :votes
  belongs_to :learning,
    counter_cache: true,
    inverse_of: :votes
end
