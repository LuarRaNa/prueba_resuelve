defmodule PruebaResuelve.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PruebaResuelveWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PruebaResuelve.PubSub},
      # Start the Endpoint (http/https)
      PruebaResuelveWeb.Endpoint,
      # Start a worker by calling: PruebaResuelve.Worker.start_link(arg)
      # {PruebaResuelve.Worker, arg}
      {Finch, name: PruebaResuelveWebApi},
      {Task.Supervisor, name: PruebaResuelveWeb.TaskSupervisor}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PruebaResuelve.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PruebaResuelveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
