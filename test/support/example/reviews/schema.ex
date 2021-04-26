# defmodule Example.Reviews.Schema do

#   use Absinthe.Schema
#   use Absinthe.Federation.Schema

#   object :review do
#     field :body, :string
#     field :author, :user, provides_fields: [:username]
#     field :product, :product
#   end

#   extend object :user do
#     key_fields [:id]
#     field :id, non_null(:id), external: true
#     field :reviews, list_of(:review)
#   end

#   extend object :product, do
#     key_fields [:upc]
#     field :upc, non_null(:string), external: true
#     field :reviews, list_of(:review)
#   end
# end
