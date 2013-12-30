class Membership < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :memberships
  belongs_to :group,
    inverse_of: :memberships

  def self.add_user_and_group(args)
    if Membership.where(group_id: args[:group]).count < 3
      Membership.find_or_create_by(group_id: args[:group], user_id: args[:user])
      return "Welcome to the group"
    else
      return "Too many people in group"
    end
  end
end
