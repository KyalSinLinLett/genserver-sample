defmodule Basic do
  use GenServer

  def start_link() do
    # you may want to register your server with `name: __MODULE__`
    # as a third argument to `start_link`
    GenServer.start_link(__MODULE__, [])
  end

  # Callbacks
  def handle_call({:some_call}, _from, state) do
    IO.puts "I handle GenServer calls"
    {:reply, state, state}
  end

  def handle_cast({:some_cast}, state) do
    IO.puts "I handle GenServer casts"
    {:noreply, state} # {:noreply, the current state of genserver}
  end

  def handle_info({:some_info}, state) do
    IO.puts "I handle messages from other places"
    {:noreply, state} # {:noreply, the current state of genserver}
  end

  # def init(_args) do
  #   {:ok, :initial_state}
  # end
end
