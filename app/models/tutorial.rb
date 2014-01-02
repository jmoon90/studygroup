class Tutorial < ActiveRecord::Base
  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :name
  has_many :groups,
    inverse_of: :tutorial

  mount_uploader :image, ImageUploader
end
