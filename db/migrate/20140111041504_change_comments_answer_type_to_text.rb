class ChangeCommentsAnswerTypeToText < ActiveRecord::Migration
  def up
    change_column :comments, :answer, :text, null: false
  end

  def down
  end
end
