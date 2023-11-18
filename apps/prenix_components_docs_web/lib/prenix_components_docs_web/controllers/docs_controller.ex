defmodule PrenixComponentsDocsWeb.DocsController do
  use PrenixComponentsDocsWeb, :controller

  def badge_show(conn, _params) do
    render(conn, page_title: "Badge")
  end

  def button_show(conn, _params) do
    render(conn, page_title: "Button")
  end

  def dropdown_show(conn, _params) do
    render(conn, page_title: "Dropdown")
  end

  def icon_show(conn, _params) do
    render(conn, page_title: "Icon")
  end

  def spinner_show(conn, _params) do
    render(conn, page_title: "Spinner")
  end
end
