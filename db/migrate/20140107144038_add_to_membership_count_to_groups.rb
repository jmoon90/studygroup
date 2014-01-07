class AddToMembershipCountToGroups < ActiveRecord::Migration
  def up
    add_column :groups, :memberships_count, :integer, default: 0
    add_index :groups, :memberships_count
  end

  def down
    remove_column :groups, :memberships_count
  end
end
