class Group < ActiveRecord::Base
  validates_presence_of :tutorial_id
  validates_presence_of :name

  belongs_to :tutorial

  has_many :memberships
  has_many :users,
    through: :memberships,
    inverse_of: :groups
  TUTORIAL_OPTIONS = [[1, 'Rails Tutorial']]
end
