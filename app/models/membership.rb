class Membership < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :memberships
  belongs_to :group,
    inverse_of: :memberships

  def self.seeder(args)
    Membership.find_or_initialize_by(group_id: args[:group]) do |mem|
      mem.user_id = args[:user]
      mem.save
    end
  end
end
