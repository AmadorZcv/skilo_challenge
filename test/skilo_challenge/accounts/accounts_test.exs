defmodule SkiloChallenge.AccountsTest do
  use SkiloChallenge.DataCase

  alias SkiloChallenge.Accounts

  describe "accounts" do
    alias SkiloChallenge.Accounts.Account

    @valid_attrs 0
    @invalid_attrs -1

    # ...

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %Account{} = account} = Accounts.open_account(@valid_attrs)
      assert account.current_balance.amount == 0
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.open_account(@invalid_attrs)
    end

    # ...
  end
end
