module Mutations
  class SendMessage < BaseMutation
  	require 'pusher'

  	argument :id, ID, required: true 
  	argument :subject, String, required: true
  	argument :description, String, required: true
  	argument :recipientLink, String, required: true

  	type Types::NoteType
 		def resolve(id: :id, subject: :subject, description: :description, recipientLink: :recipientLink)
 			if !User.exists?(inlink: recipientLink)
 				GraphQL::ExecutionError.new("No user exists with that link")		
 			else

 				#loading pusher...
 				pusher = Pusher::Client.new(
 				  app_id: '989654',
 				  key: 'e2efd547e5c8e70a45b1',
 				  secret: 'b355539706b3598864a6',
 				  cluster: 'us2',
 				  encrypted: true
 				)

 				recipient = User.find_by(inlink: recipientLink)
 				message = Note.new(subject: subject, description: description, user_id: id, inbox_id: recipient.inbox.id, status: "sent")
 				message.save!

 				pusher.trigger('paperboy-message-network', 'new-message', {
 					receiver_id: recipient.id
 				})
 				return message
 			end	
 		end
  end
end