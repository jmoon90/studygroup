class Membership < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :memberships
  belongs_to :group,
    inverse_of: :memberships

  def self.add_user_and_group(args)
    Membership.find_or_create_by(group_id: args[:group], user_id: args[:user])
  end

  def self.delete_user_and_group(args)
    individual_mem = Membership.where(group_id: args[:group], user_id: args[:user])
    Membership.delete(individual_mem)
  end
end
