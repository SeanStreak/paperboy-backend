class AddInboxRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :inbox, foreign_key: true
  end
end
