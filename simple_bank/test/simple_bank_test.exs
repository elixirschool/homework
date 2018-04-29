defmodule SimpleBankTest do
  use ExUnit.Case, async: false

  alias SimpleBank.Account

  setup do
    {:ok, bank_pid} = SimpleBank.start_link([%Account{balance: 100, id: "test_id", name: "Test"}])
    {:ok, bank: bank_pid}
  end

  describe "register/2" do
    test "creates a new account and generates an account id", %{bank: bank_pid} do
      {:ok, account_id} = SimpleBank.register(bank_pid, "Another Test Account")
      assert is_binary(account_id)
    end

    test "raises an error for existing account names", %{bank: bank_pid}  do
      {:error, :existing_account} = SimpleBank.register(bank_pid, "Test")
    end
  end

  describe "deposit/3" do
    test "increases the account balance by the deposited amount", %{bank: bank_pid}  do
      assert {:ok, 110} == SimpleBank.deposit(bank_pid, "test_id", 10)
    end

    test "does not allow deposits of negative ammounts", %{bank: bank_pid}  do
      assert {:error, :pos_integer_only} == SimpleBank.deposit(bank_pid, "test_id", -1)
    end

    test "raises an error if the account does not exist", %{bank: bank_pid}  do
      assert {:error, :missing_account} == SimpleBank.deposit(bank_pid, "doesnotexist", 10)
    end
  end

  describe "balance/2" do
    test "returns the current account balance", %{bank: bank_pid}  do
      assert {:ok, 110} == SimpleBank.deposit(bank_pid, "test_id", 10)
    end

    test "raises an error if the account does not exist", %{bank: bank_pid}  do
      assert {:error, :missing_account} == SimpleBank.balance(bank_pid, "doesnotexist")
    end
  end

  describe "withdrawl/3" do
    test "decreases the account balance by the withdrawn amount", %{bank: bank_pid}  do
      assert {:ok, 100} == SimpleBank.withdrawl(bank_pid, "test_id", 10)
    end

    test "does not negative ammount balances", %{bank: bank_pid}  do
      assert {:error, :insufficient_funds} == SimpleBank.withdrawl(bank_pid, "test_id", -1)
    end

    test "does not allow withdrawls of negative ammounts", %{bank: bank_pid}  do
      assert {:error, :pos_integer_only} == SimpleBank.withdrawl(bank_pid, "test_id", 1000)
    end

    test "raises an error if the account does not exist", %{bank: bank_pid}  do
      assert {:error, :missing_account} == SimpleBank.deposit(bank_pid, "doesnotexist", 10)
    end
  end
end
