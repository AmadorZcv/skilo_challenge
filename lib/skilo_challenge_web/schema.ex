defmodule SkiloChallengeWeb.Schema do
  use Absinthe.Schema
  import_types(SkiloChallengeWeb.Schema.ContentTypes)

  alias SkiloChallengeWeb.Resolvers

  query do
    @desc "Get all accounts"
    field :accounts, list_of(:account) do
      resolve(&Resolvers.Account.list_accounts/3)
    end
  end
end
