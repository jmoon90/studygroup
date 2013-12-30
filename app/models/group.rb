class Group < ActiveRecord::Base
  # This value is not a constant so it shouldnt be in a constant
  TUTORIAL_OPTIONS = @tutorials_list

  validates_presence_of :tutorial_id
  validates_presence_of :name

  belongs_to :tutorial

  has_many :memberships,
    dependent: :destroy,
    inverse_of: :group

  has_many :users,
    through: :memberships

  def self.tutorial_index_and_name
    @tutorials_list = []
    Tutorial.all.each do |tutorial|
      @tutorials_list << [tutorial.name, tutorial.id]
    end
  end

  def self.add_user_to_group(args)
    Membership.find_or_create_by(group_id: args[:group], user_id: args[:user])
  end

  tutorial_index_and_name
end
