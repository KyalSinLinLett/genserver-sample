defmodule BasicSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Basic1, []),
      worker(Basic2, []),
      worker(Basic3, []),
      worker(Basic4, [])
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end

defmodule Basic1 do
  use GenServer

  def start_link do
    # you may want to register your server with `name: __MODULE__`
    # as a third argument to `start_link`
    IO.puts "Basic1 is starting..."
    GenServer.start_link(__MODULE__, [])
  end
end

defmodule Basic2 do
  use GenServer

  def start_link do
    # you may want to register your server with `name: __MODULE__`
    # as a third argument to `start_link`
    IO.puts "Basic2 is starting..."
    GenServer.start_link(__MODULE__, [])
  end
end

defmodule Basic3 do
  use GenServer

  def start_link do
    # you may want to register your server with `name: __MODULE__`
    # as a third argument to `start_link`
    IO.puts "Basic3 is starting..."
    GenServer.start_link(__MODULE__, [])
  end
end

defmodule Basic4 do
  use GenServer

  def start_link do
    # you may want to register your server with `name: __MODULE__`
    # as a third argument to `start_link`
    IO.puts "Basic4 is starting..."
    GenServer.start_link(__MODULE__, [])
  end
end

# process restart strategy precedes supervisor strategy
# change strategies to see how supervisors will handle our crashed/failed Genserver processes
