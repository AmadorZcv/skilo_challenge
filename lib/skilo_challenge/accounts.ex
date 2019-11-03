defmodule SkiloChallenge.Accounts do
  alias SkiloChallenge.Repo
  alias SkiloChallenge.Accounts.Account
  alias SkiloChallenge.Accounts.Transaction

  def list_accounts() do
    Repo.all(Account)
  end

  def open_account(balance) do
    %Account{}
    |> Account.changeset(%{current_balance: balance})
    |> Repo.insert()
  end

  def create_transaction(sender_id, address_id, amount) do
    %Transaction{}
    |> Transaction.changeset(%{sender_id: sender_id, address_id: address_id, amount: amount})
    |> Repo.insert()
  end

  def change_account_balance(id, balance) do
    account = Repo.get!(Account, id)

    Account.changeset(account, %{current_balance: account.current_balance.amount + balance})
    |> Repo.update()
  end

  def transaction(sender_id, address_id, amount) do
    Repo.transaction(fn ->
      # Removing balance from sender
      change_account_balance(sender_id, -amount)
      # Adding balance to address
      change_account_balance(address_id, amount)
      # Creating transaction record
      create_transaction(sender_id, address_id, amount)
    end)
  end
end
