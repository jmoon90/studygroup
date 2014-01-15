class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description

  belongs_to :user,
    inverse_of: :posts
  belongs_to :group,
    inverse_of: :posts

  has_many :comments,
    inverse_of: :post,
    dependent: :destroy
  has_many :taggings,
    as: :taggable,
    dependent: :destroy
  has_many :tags,
    through: :taggings,
    inverse_of: :posts

  def tag_list=(tag_list)
    self.tags = tag_list.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def tag_list
    tags.pluck(:name).join(', ')
  end
end
