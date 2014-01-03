class AddSizeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :size, :integer, null: false, default: 6
  end
end
