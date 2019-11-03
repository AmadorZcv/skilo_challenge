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

  mutation do
    @desc "Open a Account"
    field :open_account, type: :account do
      arg(:balance, non_null(:float))

      resolve(&Resolvers.Account.open_account/3)
    end
  end
end
