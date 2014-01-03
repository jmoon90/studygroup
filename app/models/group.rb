class Group < ActiveRecord::Base
  validates_presence_of :tutorial_id
  validates_presence_of :name
  validates_presence_of :size
  validates_inclusion_of :size, in: 1..12

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

  def self.acs
    order(group.users :acs)
  end

  def self.desc
    order(group.users :desc)
  end
end
