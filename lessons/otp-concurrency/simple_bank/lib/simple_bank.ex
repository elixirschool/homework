defmodule SimpleBank do
  @moduledoc """
  SimpleBank is a GenServer charading as a bank.
  """
  use GenServer

  @typedoc """
   An atom describing an error
   """
   @type reason :: atom

   alias SimpleBank.Account

  def start_link(initial_state \\ %{}) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  @spec register(pid(), String.t()) :: {:ok, String.t()} | {:error, reason}
  def register(bank_pid, name) do
    case get_account(bank_pid, name) do
      nil ->
        account = %Account{balance: 0, id: UUID.uuid4(), name: name}
        GenServer.cast(bank_pid, {:register, account})
        {:ok, account.id}
      %Account{} ->
        {:error, :existing_account}
    end
  end

  def get_account(bank_pid, name) do
    GenServer.call(bank_pid, {:get_account, name})
  end

  def get_account_by_id(bank_pid, account_id) do
    GenServer.call(bank_pid, {:get_account_by_id, account_id})
  end

  @spec deposit(pid(), String.t(), pos_integer()) :: {:ok, pos_integer()} | {:error, reason}
  def deposit(bank_pid, account_id, amount) when is_integer(amount) and amount > 0 do
    case get_account_by_id(bank_pid, account_id) do
      nil -> {:error, :missing_account}
      account ->
        account = GenServer.call(bank_pid, {:deposit, account, amount})
        {:ok, account.balance}
    end
  end

  def deposit(_bank_pid, _account_id, amount) when is_integer(amount) and amount <= 0  do
    {:error, :pos_integer_only}
  end

  @spec balance(pid(), String.t()) :: {:ok, pos_integer} | {:error, reason}
  def balance(bank_pid, account_id) do
    case get_account_by_id(bank_pid, account_id) do
      nil -> {:error, :missing_account}
      account ->
        {:ok, account.balance}
    end
  end

  @spec withdrawl(pid(), String.t(), pos_integer()) :: {:ok, {pos_integer(), pos_integer()}} | {:error, reason}
  def withdrawl(bank_pid, account_id, amount) when is_integer(amount) and amount > 0 do
    case get_account_by_id(bank_pid, account_id) do
      nil -> {:error, :missing_account}
      account ->
        if account.balance < amount do
          {:error, :insufficient_funds}
        else
          account = GenServer.call(bank_pid, {:withdrawal, account, amount})
          {:ok, account.balance}
        end
    end
  end

  def withdrawl(_bank_pid, _account_id, amount) when is_integer(amount) and amount <= 0 do
    {:error, :pos_integer_only}
  end

  def init(initial_state) do
    {:ok, initial_state}
  end

  def handle_cast({:register, account}, state) do
    {:ok, [state | account]}
  end

  def handle_call({:get_account, account_name}, _from, state) do
    case Enum.find(state, fn account -> account.name == account_name end) do
      nil -> {:reply, nil, state}
      account -> {:reply, account, state}
    end
  end

  def handle_call({:get_account_by_id, account_id}, _from, state) do
    case Enum.find(state, fn account -> account.id == account_id end) do
      nil -> {:reply, nil, state}
      account -> {:reply, account, state}
    end
  end

  def handle_call({:deposit, account, amount}, _from, state) do
      account = do_deposit(account, amount)
      new_state = update_account_in_state(account, state)
    {:reply, account, new_state}
  end

  def handle_call({:withdrawal, account, amount}, _from, state) do
      account = do_withdrawal(account, amount)
      new_state = update_account_in_state(account, state)
    {:reply, account, new_state}
  end

  def do_deposit(account, amount) do
    Map.put(account, :balance, account.balance + amount)
  end

  def do_withdrawal(account, amount) do
    Map.put(account, :balance, account.balance - amount)
  end

  def update_account_in_state(account, state) do
    accounts = Enum.reject(state, fn a -> a.id == account.id end)
    [accounts | account]
  end
end
