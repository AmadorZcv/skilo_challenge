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

    @desc "Transfer Money"
    field :transfer_money, type: :transaction do
      arg(:amount, non_null(:float))
      arg(:sender, non_null(:id))
      arg(:address, non_null(:id))
      resolve(&Resolvers.Transaction.make_transaction/3)
    end
  end
end
