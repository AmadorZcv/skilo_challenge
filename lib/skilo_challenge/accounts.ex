defmodule SkiloChallenge.Accounts do
  alias SkiloChallenge.Repo
  alias SkiloChallenge.Accounts.Account

  def list_accounts() do
    []
  end

  def open_account(balance) do
    %Account{}
    |> Account.changeset(%{current_balance: balance})
    |> Repo.insert()
  end
end
