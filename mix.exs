defmodule Lab.Mixfile do
  use Mix.Project

  def project do
    [app: :lab,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Lab.Application, []},
     extra_applications: [
       :ecto,
       :mongodb,
       :runtime_tools,
       :logger,
       # :logger_file_backend,
       :poolboy,
       :uuid,
       # :httpoison,
       :absinthe_plug
     ]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    # [{:phoenix, "~> 1.3.0-rc"},
    #  {:phoenix_pubsub, "~> 1.0"},
    #  {:phoenix_ecto, "~> 3.2"},
    # #  {:postgrex, ">= 0.0.0"},
    #  {:phoenix_html, "~> 2.6"},
    #  {:phoenix_live_reload, "~> 1.0", only: :dev},
    # #  {:mongodb_ecto, "~> 0.1"},
    #  {:mongodb_ecto, github: "michalmuskala/mongodb_ecto", branch: "ecto-2"},
    # #  {:mongodb_ecto, github: "zeroasterisk/mongodb_ecto", branch: "elixir-ecto-v2.0.1"},
    #
    #  {:ecto, "~> 2.0", override: true},
    #  {:gettext, "~> 0.11"},
    #  {:cowboy, "~> 1.0"}
    # ]

    [{:phoenix, "~> 1.3.0-rc"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:mix_test_watch,
       github: "zeroasterisk/mix-test.watch",
       branch: "62-revert-fs-0.9.1-to-match-phoenix_live_reload",
       only: :dev, runtime: false
     },
     #{:mix_test_watch, "~> 0.4", only: :dev, runtime: false},
     {:poolboy, ">= 0.0.0"},
     # the mongodb_ecto & phoenix_ecto, both need to require same {:ecto, "~> 2.0"}
     {:phoenix_ecto, github: "phoenixframework/phoenix_ecto", ref: "v3.0.1"},
     #  {:mongodb_ecto, github: "zeroasterisk/mongodb_ecto", branch: "elixir-ecto-v2.0.1"},
     #--REVERTED-- {:phoenix_ecto, "~> 3.2"},
     #  --NOTREADY-- {:mongodb_ecto, github: "michalmuskala/mongodb_ecto", branch: "ecto-2.1"},
     {:mongodb_ecto, github: "michalmuskala/mongodb_ecto", branch: "ecto-2"},
     {:ecto, "~> 2.0.0", override: true},
     #  {:postgrex, ">= 0.0.0"},
     # {:logger_file_backend, "0.0.8"},
     {:ex_doc, "~> 0.16.1"},
     {:ecto_enum, "~> 1.0"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     # Poision 3.+ flags older phoenix ecto -- no breaking changes override:true
     {:poison, "~> 3.1", override: true},
     {:timex, "~> 3.0"},
     {:uuid, "~> 1.1" },
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:absinthe, "~> 1.3"},
     # {:absinthe, github: "absinthe-graphql/absinthe", branch: "master"},
     {:absinthe_plug, github: "absinthe-graphql/absinthe_plug", branch: "master"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
