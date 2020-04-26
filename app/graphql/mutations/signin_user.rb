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
  			#token
        puts user.inlink
      	token = JWT.encode(user.inlink, "secret")

      	context[:session][:token] = token
      	#user
      	{ user: user, token: token }
  		end
  	end		
  end
end