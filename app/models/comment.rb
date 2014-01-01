class Comment < ActiveRecord::Base
  validates_presence_of :answer
  validates_presence_of :post
  validates_presence_of :user
  belongs_to :post
  belongs_to :user
end
