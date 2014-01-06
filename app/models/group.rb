class Group < ActiveRecord::Base
  validates_presence_of :tutorial_id
  validates_presence_of :name
  validates_presence_of :size
  validates_inclusion_of :size, in: 1..12, message: 'must be between 1 and 12'

  belongs_to :tutorial,
    inverse_of: :groups

  has_many :memberships
  has_many :memberships,
    dependent: :destroy,
    inverse_of: :group

  has_many :users,
    through: :memberships,
    inverse_of: :groups

  has_many :posts,
    dependent: :destroy,
    inverse_of: :group

  def self.highest_user_count
    sort = all.sort_by do |group|
      group.users.count
    end
    sort.reverse
  end

  def self.lowest_user_count
    all.sort_by do |group|
      group.users.count
    end
  end
end
