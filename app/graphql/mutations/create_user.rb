module Mutations
  class CreateUser < BaseMutation
  	argument :name, String, required: true
  	argument :inlink, String, required: true
  	argument :password, String, required: true

  	field :token, String, null: true
  	field :user, Types::UserType, null: true
  	
  	def resolve(name: :name, inlink: :inlink, password: :password)
  		if User.exists?(inlink: inlink)
  			GraphQL::ExecutionError.new('Sorry, a user with that in-link already exists!')
  		else
  			user = User.create!(name: name, inlink: inlink, password: password)
  			crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
  			token = crypt.encrypt_and_sign("user-id:#{ user.id }")
				{ user: user, token: token }
  		end
  	end
  end
end