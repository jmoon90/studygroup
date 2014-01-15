class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :taggable_id , null: false, index: true
      t.string :taggable_type, null: false
      t.integer :tag_id, null: false, index: true
      t.timestamps
    end
  end
end
