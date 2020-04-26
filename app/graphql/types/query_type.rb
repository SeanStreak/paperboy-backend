module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :user_exists, Boolean, null: false do
      argument :inlink, String, required: true
    end

    field :get_user, UserType, null: true do
      argument :id, Integer, required: true
    end

    def user_exists(inlink: :inlink)
      User.exists?(inlink: inlink)
    end
    
    def get_user(id: :id)
      User.find(id)
    end
    
  end
end
