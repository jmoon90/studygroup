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
    tag_list.split(',').each do |tag_name|
      tag_name.strip!
      tag = Tag.find_or_initialize_by(name: tag_name)
      self.tags << tag
    end
  end

  def tag_list
    tags.pluck(:name).join(', ')
  end
end
