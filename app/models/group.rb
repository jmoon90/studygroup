class Group < ActiveRecord::Base
  validates_presence_of :tutorial_id
  validates_presence_of :name

  belongs_to :tutorial

  has_many :memberships
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
  TUTORIAL_OPTIONS = @tutorials_list

end
