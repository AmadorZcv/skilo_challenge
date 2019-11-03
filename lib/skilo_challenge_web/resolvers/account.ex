defmodule SkiloChallengeWeb.Resolvers.Account do
  alias SkiloChallenge.Accounts.Account
  alias SkiloChallenge.Accounts

  defp to_graphql(%Account{id: id, current_balance: current_balance}) do
    %{uuid: id, current_balance: current_balance}
  end

  def list_accounts(_parent, _args, _resolution) do
    accounts =
      Accounts.list_accounts()
      |> Enum.map(&to_graphql/1)

    {:ok, accounts}
  end

  # Transformar o balance em float Ex: 45.5 para o Integer que o banco aceita
  def balance_to_integer(balance) do
    {:ok, %{amount: amount, currency: _}} = Money.parse(balance, :BRL)
    IO.inspect(amount)
    amount
  end

  def open_account(_parent, args, _resolution) do
    balance = balance_to_integer(args.balance)

    case Accounts.open_account(balance) do
      {:ok, account} ->
        {:ok, to_graphql(account)}

      {:error, changeset} ->
        IO.inspect(changeset)
        {:error, "Invalid Balance"}
    end
  end
end
