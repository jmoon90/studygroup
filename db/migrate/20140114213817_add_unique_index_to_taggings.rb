class AddUniqueIndexToTaggings < ActiveRecord::Migration
  def up
    add_index :taggings, [:taggable_id, :tag_id], unique: true
    add_index :taggings, [:taggable_id, :taggable_type]
  end

  def down
    remove_index :taggings, [:taggable_id, :tag_id]
    remove_index :taggings, [:taggable_id, :taggable_type]
  end
end
