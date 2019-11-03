defmodule SkiloChallenge.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :current_balance, :integer

      timestamps()
    end

    create constraint("accounts", :balance_cannot_be_negative, check: "current_balance >= 0")
  end
end
