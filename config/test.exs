use Mix.Config

# Configure your database
config :skilo_challenge, SkiloChallenge.Repo,
  username: "postgres",
  password: "postgres",
  database: "skilo_challenge_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :skilo_challenge, SkiloChallengeWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
