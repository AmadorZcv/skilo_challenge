defmodule SkiloChallenge.Repo.Migrations.SenderDifferentThanAddress do
  use Ecto.Migration

  def change do
    create constraint("transactions", :sender_different_than_address,
             check: "sender_id != address_id"
           )
  end
end
