defmodule Absinthe.Federation.Notation do
  @moduledoc """

  """

  defmacro __using__(_opts) do
    notations()
  end

  @spec notations() :: Macro.t()
  defp notations() do
    quote do
      import Absinthe.Federation.Notation, only: :macros

    end
  end

  defmacro extend({:object, meta, [identifier, attrs]}, do: block) when is_list(attrs) do
    do_object(meta, identifier, attrs, block)
  end

  defmacro extend({:object, meta, [identifier]}, do: block) do
    do_object(meta, identifier, [], block)
  end

  defmacro extend({:query, meta, attrs}, do: block) do
    do_query(meta, attrs, block)
  end

  defp do_query(meta, attrs, block) do
    block = [
      quote do

      end,
      query_body(),
      block
    ]
    {:query, meta, attrs, [[do: block]]}
  end

  defp do_object(meta, identifier, attrs, block) do
    block = [
      quote do

      end,
      object_body(),
      block
    ]

    {:object, meta, [identifier, attrs] ++ [[do: block]]}
  end

  defp query_body() do
    quote do

    end
  end

  # Automatically add:
  # - An id field that resolves to the generated global ID
  #   for an object of this type
  # - A declaration that this implements the node interface
  defp object_body() do
    quote do
      interface(:entity)
    end
  end
end
