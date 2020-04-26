class AddInboxRefToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :inbox, foreign_key: true
  end
end
