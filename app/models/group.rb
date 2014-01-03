class Group < ActiveRecord::Base
 # WHY DOESN"T attr accessor work?
  attr_writer :args

  def self.args
    @args ||= Hash.new
  end

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

  def self.finds_max_size(group)
    self.args
    self.max_group_size(group)
    self.current_group_size(group)
  end

  def self.max_group_size(group)
    @args[:group_max] = group.size
    @args
  end

  #Design decision to separte two code that are very similar.
  def self.current_group_size(group)
    @args[:current_group_size] = group.users.count
    @args
  end
end
