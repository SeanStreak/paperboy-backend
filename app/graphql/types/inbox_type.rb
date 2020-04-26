module Types
	class InboxType < BaseObject
		field :id, ID, null: false
		field :user, UserType, null: false
		field :get_inbox_content, [InboxItemType], null: true
	end
end