class ChangeMessageDescriptionToText < ActiveRecord::Migration
  def up
    change_column :messages, :description, :text, null: false
  end

  def down
  end
end
