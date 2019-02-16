# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kira,
  ecto_repos: [Kira.Repo]

# Configures the endpoint
config :kira, KiraWeb.Endpoint,
  url: [host: "localhost"],  # TODO: hide secret
  secret_key_base:
    "pp9AKGNUuSK/GvKgmSrIb+YRz/3O/w598i9QjE4axB4ZVK7vrjab4nURwZ8KRZbz",
  render_errors: [view: KiraWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kira.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Custom configuration for this app:
config :kira, :gitlab,
  personal_token: System.get_env("KIRA_GITLAB_PERSONAL_TOKEN"),
  domain: "https://gitlab.com"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
