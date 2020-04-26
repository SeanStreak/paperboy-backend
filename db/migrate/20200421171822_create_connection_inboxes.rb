class CreateConnectionInboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :connection_inboxes do |t|

      t.timestamps
    end
  end
end
