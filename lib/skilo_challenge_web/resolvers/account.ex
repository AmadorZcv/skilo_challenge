defmodule SkiloChallengeWeb.Resolvers.Account do
  alias SkiloChallenge.Accounts.Account

  defp to_graphql(%Account{id: id, current_balance: current_balance}) do
    %{uuid: id, current_balance: current_balance}
  end

  def list_accounts(_parent, _args, _resolution) do
    accounts =
      SkiloChallenge.Accounts.list_accounts()
      |> Enum.map(&to_graphql/1)

    {:ok, accounts}
  end
end
