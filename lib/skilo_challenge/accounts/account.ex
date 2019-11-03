defmodule SkiloChallenge.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias SkiloChallenge.Accounts.Transaction

  schema "accounts" do
    field :current_balance, Money.Ecto.Amount.Type
    has_many :out_transaction, Transaction, foreign_key: :sender_id, references: :id
    has_many :in_transaction, Transaction, foreign_key: :address_id, references: :id
    timestamps()
  end

  def changeset(account, attrs) do
    account
    |> cast(attrs, [:current_balance])
    |> validate_required([:current_balance])
    |> check_constraint(:current_balance, name: :balance_cannot_be_negative)
  end
end
