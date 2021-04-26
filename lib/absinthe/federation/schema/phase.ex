defmodule Absinthe.Federation.Schema.Phase do
  use Absinthe.Phase

  alias Absinthe.Blueprint
  alias Absinthe.Blueprint.Schema

  def run(blueprint, _) do
    # {blueprint, _acc} = Blueprint.postwalk(blueprint, [], &collect_types/2)

    {:ok, blueprint}
  end
end
