class Membership < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :memberships
  belongs_to :group,
    inverse_of: :memberships

  def self.seeder(group)
    group.each do |group|
      Membership.find_or_initialize_by(group_id: group[:group_id]) do |mem|
        mem.user_id = group[:user_id]
        mem.save
      end
    end
  end
end
