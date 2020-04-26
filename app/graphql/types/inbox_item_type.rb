class Types::InboxItemType < Types::BaseUnion
	description "Inbox item type"
	possible_types Types::TaskType, Types::NoteType

	def self.resolve_type(object, context)
		if object.is_a?(Task)
			Types::TaskType
		else
			Types::NoteType
		end
	end
end