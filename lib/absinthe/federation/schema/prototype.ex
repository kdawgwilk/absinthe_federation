defmodule Absinthe.Federation.Schema.Prototype do
  @moduledoc false

  defmacro __using__(opts) do
    do_using(opts)
  end

  defp do_using(_opts) do
    quote do
      use Absinthe.Schema.Prototype

      directive :key do
        arg :fields, non_null(:string)
        on [:object, :interface]
      end

      directive :external do
        on [:object, :field]
      end

      directive :requires do
        arg :fields, non_null(:string)
        on [:field]
      end

      directive :provides do
        arg :fields, non_null(:string)
        on [:field]
      end
    end
  end
end
