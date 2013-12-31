class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.references :user
      t.references :group

      t.timestamps
    end
  end
end
