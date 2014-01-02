class Comment < ActiveRecord::Base
  validates_presence_of :answer
  validates_presence_of :post
  validates_presence_of :user
  belongs_to :post,
    inverse_of: :comments
  belongs_to :user,
    inverse_of: :comments
end
