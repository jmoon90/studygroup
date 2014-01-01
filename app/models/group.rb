class Group < ActiveRecord::Base
  validates_presence_of :tutorial_id
  validates_presence_of :name

  belongs_to :tutorial

  has_many :memberships
  has_many :memberships,
    dependent: :destroy,
    inverse_of: :group

  has_many :users,
    through: :memberships,
    inverse_of: :groups

  has_many :posts,
    inverse_of: :group
end
