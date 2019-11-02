defmodule SkiloChallengeWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :skilo_challenge

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Absinthe.Plug,
    schema: SkiloChallengeWeb.Schema

end
