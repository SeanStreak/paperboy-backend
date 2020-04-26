module Types
	class UserType < BaseObject
		field :id, ID, null: false
		field :name, String, null: false
		field :inlink, String, null: false
		field :inbox, InboxType, null: false
		field :notes, [NoteType], null: false
	end
end