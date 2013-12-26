class Membership < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :memerships
  belongs_to :group,
    inverse_of: :memerships
end
