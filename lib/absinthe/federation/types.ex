defmodule Absinthe.Federation.Types do
  @moduledoc false

  use Absinthe.Schema.Notation

  directive :key do
    description """
    The `@key` directive is used to indicate a combination of fields that can be used
    to uniquely identify and fetch an object or interface.
    """
    arg :fields, non_null(:string)
    on [:object, :interface]
  end

  directive :external do
    description """
    The @external directive is used to mark a field as owned by another service.
    This allows service A to use fields from service B while also knowing at runtime the types of that field.
    """
    on [:object, :field]
  end

  directive :requires do
    description """
    The @requires directive is used to annotate the required input fieldset from a base type for a resolver.
    It is used to develop a query plan where the required fields may not be needed by the client,
    but the service may need additional information from other services.
    """
    arg :fields, non_null(:string)
    on [:field]
  end

  directive :provides do
    description """
    The `@provides` directive is used to annotate the expected returned fieldset
    from a field on a base type that is guaranteed to be selectable by the gateway.
    """
    arg :fields, non_null(:string)
    on [:field]
  end

  scalar :any, name: "_Any"

  union :entity, name: "_Entity" do
    types []
  end

  # object :service, name: "_Service" do
  #   field :sdl, :string
  # end
end
