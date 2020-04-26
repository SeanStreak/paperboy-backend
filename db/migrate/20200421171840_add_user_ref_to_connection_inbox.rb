class AddUserRefToConnectionInbox < ActiveRecord::Migration[5.2]
  def change
    add_reference :connection_inboxes, :user, foreign_key: true
  end
end
