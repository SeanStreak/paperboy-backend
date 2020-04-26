module Mutations
  class SigninUser < BaseMutation
  	argument :inlink, String, required: true
  	argument :password, String, required: true

  	field :token, String, null: true
  	field :user, Types::UserType, null: true

  	def resolve(inlink: :inlink, password: :password)
      puts inlink
  		if !User.exists?(inlink: inlink)
  			GraphQL::ExecutionError.new('No user found with that in-link')
  		else
  			#load the user
  			user = User.find_by(inlink: inlink.to_s)
  			#authenticate the user
  			return GraphQL::ExecutionError.new('Invalid password') unless user.authenticate(password)
  			#crypt
  			crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      	#token
      	token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      	context[:session][:token] = token
      	#user
      	{ user: user, token: token }
  		end
  	end		
  end
end