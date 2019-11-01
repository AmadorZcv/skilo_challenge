defmodule SkiloChallenge.Repo do
  use Ecto.Repo,
    otp_app: :skilo_challenge,
    adapter: Ecto.Adapters.Postgres
end
