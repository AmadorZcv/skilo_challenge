defmodule SkiloChallengeWeb.Router do
  use SkiloChallengeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: SkiloChallengeWeb.Schema

  scope "/api", SkiloChallengeWeb do
    pipe_through :api
  end
end
