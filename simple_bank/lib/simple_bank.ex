defmodule SimpleBank do
  @moduledoc """
  SimpleBank is a GenServer charading as a bank.
  """
  use GenServer

  def start_link(initial_state \\ %{}) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  @spec register(pid(), String.t()) :: {:ok, String.t()} | {:error, reason}
  def register(bank_pid, name) do
  end

  @spec deposit(pid(), String.t(), pos_integer()} :: {:ok, pos_integer()} | {:error, reason}
  def deposit(bank_pid, account_id, amount) when is_integer(amount) and amount > 0 do
  end

  def deposit(_bank_pid, _account_id, _amount) do
    {:error, :missing_account}
  end

  @spec deposit(pid(), String.t()} :: {:ok, pos_integer} | {:error, reason}
  def balance(bank_pid, account_id) do
  end

  @spec withdrawl(pid(), String.t(), pos_integer()} :: {:ok, {pos_integer(), pos_integer()}} | {:error, reason}
  def withdrawl(bank_pid, account_id, amount) do
  end

  def init(initial_state) do
    {:ok, initial_state}
  end
end
