defmodule Absinthe.Federation.Schema do
  @moduledoc false

  defmacro __using__(opts) do
    do_using(opts)
  end

  defp do_using(_opts) do
    quote do
      @pipeline_modifier unquote(__MODULE__)

      use Absinthe.Federation.Notation
      import_types(Absinthe.Federation.Types)
    end
  end

  def pipeline(pipeline) do
    pipeline
    |> Absinthe.Pipeline.insert_after(Absinthe.Phase.Schema.TypeImports, __MODULE__.Phase)
  end
end
