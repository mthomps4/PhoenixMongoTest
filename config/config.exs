# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :lab,
  ecto_repos: [Lab.Repo]

# Configures the endpoint
config :lab, Lab.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "653armcvGit/tENUbzVeF+1fZoYaUqBT3H7KFHn4Np8sA0Q1iX5h/7Xpsnh1ew/k",
  render_errors: [view: Lab.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Lab.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# config :lab, Lab.Repo,
#   adapter: Mongo.Ecto,
#   database: "ecto-mongo-test",
#   hostname: "localhost"
#   # username: "mongodb",
#   # password: "mongosb",

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
