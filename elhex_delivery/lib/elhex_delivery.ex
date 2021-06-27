defmodule ElhexDelivery do
  @moduledoc """
  Documentation for `ElhexDelivery`.
  """

  use Application

  def start(_type, _args) do
    ElhexDelivery.Supervisor.start_link
  end
end
