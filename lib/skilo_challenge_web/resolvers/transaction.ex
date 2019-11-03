defmodule SkiloChallengeWeb.Resolvers.Transaction do
  alias SkiloChallenge.Accounts.Transaction
  alias SkiloChallenge.Accounts

  defp to_graphql(%Transaction{
         id: id,
         address_id: address_id,
         amount: amount,
         inserted_at: inserted_at
       }) do
    %{uuid: id, address: address_id, amount: amount, when: inserted_at}
  end

  defp amount_to_integer(amount) do
    {:ok, %{amount: amount, currency: _}} = Money.parse(amount, :BRL)
    amount
  end

  def make_transaction(_parent, args, _resolution) do
    amount = amount_to_integer(args.amount)

    case Accounts.make_transaction(args.sender, args.address, amount) do
      {:ok, {:ok, transaction}} ->
        {:ok, to_graphql(transaction)}

      true ->
        {:error, "Reason"}
    end
  end
end
