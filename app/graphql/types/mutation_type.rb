module Types
  class MutationType < Types::BaseObject
    # CreateUser
    field :create_user, mutation: Mutations::CreateUser

    # SignUser
    field :signin_user, mutation: Mutations::SigninUser

    #SendMessageMutation
    field :send_message, mutation: Mutations::SendMessage

    #SendTaskMutation
    field :send_task, mutation: Mutations::SendTask

    #UpdateInboxItemStatus
    field :update_inbox_item_status, mutation: Mutations::UpdateInboxItemStatus
  end
end
