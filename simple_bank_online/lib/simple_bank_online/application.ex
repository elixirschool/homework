defmodule SimpleBankOnline.Application do
  @moduledoc false

  use Application

  import Supervisor.Spec

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, SimpleBankOnline.Router, [], port: 8000),
      worker(SimpleBank, [])
    ]

    opts = [strategy: :one_for_one, name: Web.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
