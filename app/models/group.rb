class Group < ActiveRecord::Base
  attr_accessor :users_in_group
  attr_accessor :group_size

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

  def self.most_users
    all.order(memberships_count: :desc)
  end

  def self.least_users
    all.order(:memberships_count)
  end

  def all
    Group.all
  end

  def self.filtered_by(options)
    options = 'all' if options.nil?
    send(options)
  end

  def users_in_group
    users.count
  end

  def self.group_size
    @group_size = group.size
  end

  def self.users_count_against_group_size(group)
    "#{ group.memberships_count } / #{ group.size }"
  end

  def self.belongs_to_current_user?(group, current_user)
    group.users.any? { |user| user == current_user }
  end
end
