defmodule SkiloChallengeWeb.Resolvers.Account do
  def list_accounts(_parent, _args, _resolution) do
    {:ok, SkiloChallenge.Accounts.list_accounts()}
  end
end
