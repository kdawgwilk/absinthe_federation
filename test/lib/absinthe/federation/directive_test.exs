defmodule Absinthe.Federation.DirectiveTest do
  use Absinthe.Federation.Case, async: true

  alias Absinthe.Schema

  defmodule TestSchema do
    use Absinthe.Schema

    query do
    end

    import_sdl("""
      scalar _Any
      scalar _FieldSet

      # a union of all types that use the @key directive
      union _Entity

      type _Service {
        sdl: String
      }

      type Query {
        _entities(representations: [_Any!]!): [_Entity]!
        _service: _Service!
      }

      directive @external on FIELD_DEFINITION
      directive @requires(fields: _FieldSet!) on FIELD_DEFINITION
      directive @provides(fields: _FieldSet!) on FIELD_DEFINITION
      directive @key(fields: _FieldSet!) on OBJECT | INTERFACE

      # this is an optional directive discussed below
      directive @extends on OBJECT | INTERFACE

    """)
  end

  describe "directives" do
    test "are loaded as built-ins" do
      assert %{
               key: "key",
               external: "external",
               requires: "requires",
               provides: "provides"
             } = TestSchema.__absinthe_directives__()

      assert TestSchema.__absinthe_directive__(:key)
      assert TestSchema.__absinthe_directive__("key") == TestSchema.__absinthe_directive__(:key)

      assert Schema.lookup_directive(TestSchema, :key) ==
               TestSchema.__absinthe_directive__(:key)

      assert Schema.lookup_directive(TestSchema, "key") ==
               TestSchema.__absinthe_directive__(:key)
    end
  end
end
