defmodule PrenixComponentsDocsWeb.PageController do
  use PrenixComponentsDocsWeb, :controller

  def home(conn, _params) do
    # require IEx
    # IEx.pry()
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn)
  end
end
