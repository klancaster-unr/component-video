defmodule Mint.MixProject do
  use Mix.Project

  @version "1.4.2"
  @repo_url "https://github.com/elixir-mint/mint"

  def project do
    [
      app: :mint,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),

      # Xref
      xref: [
        exclude: [
          :persistent_term,
          {:ssl, :cipher_suites, 1},
          CAStore
        ]
      ],

      # Dialyxir
      dialyzer: [
        plt_add_apps: [:castore]
      ],

      # Code coverage
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls.html": :test, coveralls: :test],

      # Hex
      package: package(),
      description: "Small and composable HTTP client.",

      # Docs
      name: "Mint",
      docs: [
        source_ref: "v#{@version}",
        source_url: @repo_url,
        extras: [
          "pages/Architecture.md",
          "pages/Decompression.md"
        ]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ssl],
      mod: {Mint.Application, []}
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @repo_url}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_env), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:castore, "~> 0.1.0", optional: true},
      {:hpax, "~> 0.1.1"},

      # Dev/test dependencies
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.20", only: :dev},
      {:excoveralls, "~> 0.14.5", only: :test},
      {:stream_data, "~> 0.5.0", only: [:dev, :test]}
    ]
  end
end