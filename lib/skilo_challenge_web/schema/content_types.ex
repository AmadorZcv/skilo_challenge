defmodule SkiloChallengeWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :account do
    field :uuid, :id
    field :currentBalance, :float
  end
end
