class Group < ActiveRecord::Base
  # This value is not a constant so it shouldnt be in a constant

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
end
