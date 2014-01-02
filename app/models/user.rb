class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :memberships,
    dependent: :destroy,
    inverse_of: :user

  has_many :groups,
    through: :memberships,
    inverse_of: :users

  has_many :posts,
    inverse_of: :user

  has_many :comments,
    inverse_of: :user
end
