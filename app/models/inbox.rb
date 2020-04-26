class Inbox < ApplicationRecord
	#belongs to a user
	belongs_to :user
	#has many notes sent to it (from another user)
	has_many :notes
	has_many :tasks

	def get_inbox_content
		return self.notes.reverse + self.tasks.reverse
	end
end
