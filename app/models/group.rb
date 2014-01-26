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
    order(memberships_count: :desc)
  end

  def self.least_users
    order(:memberships_count)
  end


  def all
    Group.all
  end

  def self.by_tutorial_name(name)
    tutorial = Tutorial.find(name)
    joins(:tutorial).where('tutorials.name' => tutorial.name )
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

  def self.recent_activity(group)
    if Post.where(group_id: group.id).empty?
      group.updated_at.strftime('%I:%M %p, %b %e')
    else
      Post.where(group_id: group.id).order(updated_at: :desc).limit(1).first.updated_at.strftime('%I:%M %p, %b %e')
    end
  end
end
