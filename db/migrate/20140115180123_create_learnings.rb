class CreateLearnings < ActiveRecord::Migration
  def change
    create_table :learnings do |t|
      t.belongs_to :user, index: true
      t.text :description
      t.string :title, null: false
      t.string :url
      t.integer :votes_count, default: 0
    end
  end
end
