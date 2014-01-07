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

  def self.highest_user_count
    joins(:memberships).joins(:users).order(:name).distinct
  end

  def self.lowest_user_count
    joins(:memberships).joins(:users).order(name: :desc).distinct
  end

  def all
    Group.all
  end

  def self.filtered_by(options)
    options = 'all' if options.nil?
    send(options)
  end

  def self.users_in_group
    Group.all.each do |group|
    binding.pry
      @user_in_group = group.users.count
    end
  end

  def self.group_size
    @group_size = group.size
  end
end
