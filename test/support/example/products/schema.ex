# defmodule Example.Products.Schema do

#   use Absinthe.Schema
#   use Absinthe.Federation.Schema

#   extend query do
#     field :top_products, list_of(:product) do
#       resolve fn _, _ ->
#         Database.top_products()
#       end
#     end
#   end

#   @key(fields: "upc")
#   object :product do
#     field :upc, non_null(:id)
#     field :name, non_null(:string)
#     field :price, non_null(:integer)
#   end
# end
