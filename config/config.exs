# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :skilo_challenge,
  ecto_repos: [SkiloChallenge.Repo]

# Configures the endpoint
config :skilo_challenge, SkiloChallengeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7JO9UtJ/FrHt8HIeU8pUSWuiN2ZytPZXPcCrhfX+nyhoxc3bUyxChqGTjZtFrXgT",
  render_errors: [view: SkiloChallengeWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SkiloChallenge.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :money,
  default_currency: :BRL

config :absinthe,
  adapter: Absinthe.Adapter.LanguageConventions

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
