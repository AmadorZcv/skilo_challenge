defmodule SkiloChallenge.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :amount, :integer
      add :sender_id, references(:accounts, on_delete: :nothing)
      add :address_id, references(:accounts, on_delete: :nothing)
      timestamps()
    end

    create constraint("transactions", :amount_greater_than_0, check: "amount > 0")
  end
end
