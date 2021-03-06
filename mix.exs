defmodule AbsintheFederation.MixProject do
  use Mix.Project

  @source_url "https://github.com/kdawgwilk/absinthe_federation"
  @version "0.1.0"

  def project do
    [
      app: :absinthe_federation,
      version: @version,
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      deps: deps(),
      dialyzer: [
        plt_add_apps: [:mix, :ex_unit],
        plt_file: {:no_warn, "priv/plts/absinthe.plt"}
      ]
    ]
  end

  defp package do
    [
      description: "Apollo Federation support for Absinthe",
      files: [
        "lib",
        "priv",
        "*.exs",
        "*.md"
      ],
      maintainers: ["Kaden Wilkinson"],
      licenses: ["MIT"],
      links: %{github: @source_url}
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "Absinthe.Federation",
      source_url: @source_url
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:absinthe, "~> 1.5.0"},

      # Dev
      {:dialyxir, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
