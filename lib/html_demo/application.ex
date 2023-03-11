defmodule HtmlDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HtmlDemoWeb.Telemetry,
      # Start the Ecto repository
      HtmlDemo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HtmlDemo.PubSub},
      # Start Finch
      {Finch, name: HtmlDemo.Finch},
      # Start the Endpoint (http/https)
      HtmlDemoWeb.Endpoint
      # Start a worker by calling: HtmlDemo.Worker.start_link(arg)
      # {HtmlDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HtmlDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HtmlDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
