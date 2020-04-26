module Types
	class TaskType < BaseObject
		field :id, ID, null: false
		field :user, UserType, null: false
		field :subject, String, null: false
		field :description, String, null: false
		field :inbox, InboxType, null: false
		field :time_stamp, String, null: false
		field :status, String, null: false
	end
end