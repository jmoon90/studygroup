class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description

  belongs_to :user,
    inverse_of: :posts
  belongs_to :group,
    inverse_of: :posts

  has_many :comments,
    inverse_of: :post
end
