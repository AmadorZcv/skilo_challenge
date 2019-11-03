defmodule SkiloChallenge.Accounts.Transaction do
  use Ecto.Schema
  import Ecto.Changeset
  alias SkiloChallenge.Accounts.Account

  schema "transactions" do
    field :amount, Money.Ecto.Amount.Type
    belongs_to :sender, Account
    belongs_to :address, Account
    timestamps()
  end

  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:amount, :sender_id, :address_id])
    |> validate_required([:amount, :sender_id, :address_id])
    |> check_constraint(:amount, name: :amount_greater_than_0)
  end
end
