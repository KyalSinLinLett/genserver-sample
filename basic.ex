defmodule Basic do
  use GenServer

  def start_link do
    # you may want to register your server with `name: __MODULE__`
    # as a third argument to `start_link`
    GenServer.start_link(__MODULE__, "Hello")
  end

  def init(initial_data) do
    greetings = %{:greeting => initial_data}
    {:ok, greetings} # this is our initial state
  end

  def get_my_state(process_id) do
    GenServer.call(process_id, {:get_the_state})
  end

  def set_my_state(process_id, new_state) do
    GenServer.call(process_id, {:set_the_state, new_state})
  end

  def handle_call({:get_the_state}, _from, my_state) do
    {:reply, my_state, my_state} # {:reply, value that we are responding, new state of our GS process}
  end

  def handle_call({:set_the_state, new_state}, _from, my_state) do
    new_state = Map.put(my_state, :greeting, new_state)
    {:reply, new_state, new_state}
  end
end
