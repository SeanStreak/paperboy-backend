class AddStatusToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :status, :string
  end
end
