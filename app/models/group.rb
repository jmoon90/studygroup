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
    @tutorials_list
  end

  TUTORIAL_OPTIONS = @tutorials_list
end
