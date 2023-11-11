defmodule PrenixComponentsDocs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DNSCluster, query: Application.get_env(:prenix_components_docs, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PrenixComponentsDocs.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PrenixComponentsDocs.Finch}
      # Start a worker by calling: PrenixComponentsDocs.Worker.start_link(arg)
      # {PrenixComponentsDocs.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: PrenixComponentsDocs.Supervisor)
  end
end
