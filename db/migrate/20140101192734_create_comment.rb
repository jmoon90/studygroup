class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
      t.string :answer, null: false

      t.timestamps
    end
  end
end
