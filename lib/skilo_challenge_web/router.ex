defmodule SkiloChallengeWeb.Router do
  use SkiloChallengeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SkiloChallengeWeb do
    pipe_through :api
  end
end
