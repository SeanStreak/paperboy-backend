class Task < ApplicationRecord
	belongs_to :user
	belongs_to :inbox

	def time_stamp
		return self.created_at.getlocal.strftime("%B %d, %I:%M%P")
	end
end
