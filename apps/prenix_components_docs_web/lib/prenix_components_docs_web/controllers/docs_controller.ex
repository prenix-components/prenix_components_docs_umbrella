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

  def table_show(conn, _params) do
    users = [
      %{id: 1, first: "Mark", last: "Otto", handle: "@mdo"},
      %{id: 2, first: "Jacob", last: "Thornton", handle: "@fat"},
      %{id: 3, first: "Larry", last: "Bird", handle: "@larry"}
    ]

    render(conn, page_title: "Table", users: users)
  end

  def tooltip_show(conn, _params) do
    render(conn, page_title: "Tooltip")
  end
end
