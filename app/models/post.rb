class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description

  belongs_to :user,
    inverse_of: :posts
  belongs_to :group,
    inverse_of: :posts

  has_many :comments,
    inverse_of: :post

  def self.add_user_and_group(args)
    find_or_create_by(group_id: args[:group], user_id: args[:user])
  end

  def self.delete_user_and_group(args)
    post = Post.where(group_id: args[:group], user_id: args[:user])
    delete(post)
  end
end
