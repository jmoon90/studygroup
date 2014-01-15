class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :taggings,
    inverse_of: :tag
  has_many :posts,
    through: :taggings,
    inverse_of: :tags
  has_many :comments,
    through: :taggings,
    inverse_of: :tags
end
