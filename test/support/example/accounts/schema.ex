# defmodule Example.Accounts.Schema do

#   use Absinthe.Schema
#   use Absinthe.Federation.Schema

#   extend query do
#     field :me, :user do
#       resolve fn _, _ ->
#         Database.user()
#       end
#     end
#   end

#   @key(fields: "id")
#   object :user do
#     field :id, non_null(:id)
#     field :username, non_null(:string)
#   end
# end
