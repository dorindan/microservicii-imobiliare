# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :apartments_api,
  ecto_repos: [ApartmentsApi.Repo]

# Configures the endpoint
config :apartments_api, ApartmentsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EP+HfssVFtxAee70xqonYX8jxt9K+jLQHPBq+YRKcIaI8MoWPhlgofQBZhbrVDjc",
  render_errors: [view: ApartmentsApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ApartmentsApi.PubSub,
  live_view: [signing_salt: "eVe8il+k"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
