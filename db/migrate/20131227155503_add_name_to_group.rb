class AddNameToGroup < ActiveRecord::Migration
  def up
    add_column :groups, :name, :string
  end

  def down
    remove_column :groups, :name, :string
  end
end
