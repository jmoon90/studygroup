class Membership < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :memberships
  belongs_to :group,
    counter_cache: true,
    inverse_of: :memberships
end
