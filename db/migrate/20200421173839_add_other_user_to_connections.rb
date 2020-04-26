class AddOtherUserToConnections < ActiveRecord::Migration[5.2]
  def change
    add_reference :connections, :other_user, index: true #foreign_key: true

    add_foreign_key :connections, :users, column: :other_user_id
  end
end
