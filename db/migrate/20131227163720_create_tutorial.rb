class CreateTutorial < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
