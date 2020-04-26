class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :subject
      t.string :description
      t.string :completion_status

      t.timestamps
    end
  end
end
