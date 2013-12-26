class Group < ActiveRecord::Base
  belongs_to :tutorial

  has_many :memberships
  has_many :users,
    through: :memberships,
    inverse_of: :groups
end
