class AddRankToColumnLearnings < ActiveRecord::Migration
  def change
    add_column :learnings, :rank, :decimal, default: 0
  end
end
