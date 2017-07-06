defmodule Scoring.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Scoring.Web.Endpoint, []),
      supervisor(Scoring.Server, []),
    ]

    opts = [strategy: :one_for_one, name: Scoring.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
