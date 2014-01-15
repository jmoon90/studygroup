class Tagging < ActiveRecord::Base
  belongs_to :tag,
    inverse_of: :taggings

  belongs_to :taggable, polymorphic: true,
    inverse_of: :taggings

  validates_uniqueness_of :taggable_id, scope: :tag_id
end
