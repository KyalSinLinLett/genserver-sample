defmodule SomeModule do
  def get_those_packages_out do
    packages = 1..20
    # {:ok, pid} = PackageReceiver.start_link # start one process for all packages, 4s -> the messages are queued in the mailbox

    Enum.each(packages, fn package ->
      IO.puts "Delivering package: #{package}"

      {:ok, pid} = PackageReceiver.start_link # start a process for each package, 1s -> one process receives one message
      PackageReceiver.leave_at_the_door(pid, package)
    end)

    IO.puts "All done with deliveries"
    IO.puts "------------------------"
  end
end

defmodule PackageReceiver do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def leave_at_the_door(receiver_pid, package_name) do
    GenServer.cast(receiver_pid, {:async_package, package_name})
  end

  def handle_cast({:async_package, package_name}, state) do
    :timer.sleep(500)
    IO.puts "I received package: #{package_name}"
    {:noreply, state}
  end
end

# 1. Create a GS process
# 2. Enumerate per package
# 3. For every package -> we cal the leave_at_the_door fn which will cast the {:async_package, p_name} message
# 4. every iteration, the timer will sleep for 1 second, then print string
# 5. since we use handle_cast, it is async and non-blocking -> iteration can happen
# whether or not the leave_at_the_door fn call is complete or not
