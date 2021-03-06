defmodule Insc.Application do
  @moduledoc """
  The Insc Application Service.

  The insc system business domain lives in this application.

  Exposes API to clients such as the `Insc.Web` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      worker(Insc.Repo, []),
    ], strategy: :one_for_one, name: Insc.Supervisor)
  end
end
