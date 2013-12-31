class Group < ActiveRecord::Base
  validates_presence_of :tutorial_id
  validates_presence_of :name

  belongs_to :tutorial

  has_many :memberships,
    dependent: :destroy,
    inverse_of: :group

  has_many :users,
    through: :memberships

  has_many :posts,
    inverse_of: :group

  def self.tutorial_index_and_name
    @tutorials_list = []
    Tutorial.all.each do |tutorial|
      @tutorials_list << [tutorial.name, tutorial.id]
    end
  end
end
