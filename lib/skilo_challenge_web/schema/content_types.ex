defmodule SkiloChallengeWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  object :account do
    field :uuid, :id
    field :currentBalance, :float
    field :transactions, list_of(:transaction)
  end

  object :transaction do
    field :uuid, :id
    field :address, :id
    field :amount, :float
    field :when, :datetime
  end
end
