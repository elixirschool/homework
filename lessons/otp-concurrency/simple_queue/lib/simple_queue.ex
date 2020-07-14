defmodule SimpleQueue do
  use GenServer

  def init(state), do: {:ok, state}

  def handle_call(:dequeue, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}

  def handle_call(:queue, _from, state), do: {:reply, state, state}

  def handle_call({:enqueue, value}, _from, state) do
    {:reply, value, state ++ [value]}
  end

  def handle_call(:sum, _from, state), do: {:reply, Enum.sum(state), state}

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def queue, do: GenServer.call(__MODULE__, :queue)
  def enqueue(value), do: GenServer.call(__MODULE__, {:enqueue, value})
  def dequeue, do: GenServer.call(__MODULE__, :dequeue)
  def sum, do: GenServer.call(__MODULE__, :sum)
end
