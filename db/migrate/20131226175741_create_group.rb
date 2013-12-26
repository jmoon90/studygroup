class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :tutorial

      t.timestamps
    end
  end
end
