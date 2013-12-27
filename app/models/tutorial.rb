class Tutorial < ActiveRecord::Base
  validates_presence_of :name
  has_many :groups,
    inverse_of: :tutorial
end
