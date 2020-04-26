module Mutations
  class UpdateInboxItemStatus < BaseMutation
  	argument :id, ID, required: true
  	argument :status, String, required: true
  	argument :item_type, String, required: true

  	type Boolean
  	def resolve(id: :id, status: :status, item_type: :item_type)
  		if (item_type == "Task")
  			puts "hit"
  			t = Task.find(id)
  			t.status = status
  			t.save!
  			return true	
  		else
  			n = Note.find(id)
  			n.status = status
  			n.save!
  			return true
  		end
  	end
  end
end