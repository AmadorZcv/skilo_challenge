defmodule SkiloChallenge.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :current_balance, Money.Ecto.Amount.Type
    timestamps()
  end

  def changeset(account, attrs) do
    account
    |> cast(attrs, [:current_balance])
    |> validate_required([:current_balance])
    |> check_constraint(:current_balance, name: :balance_cannot_be_negative)
  end
end
