defmodule PrenixComponentsDocsWeb.DocsController do
  use PrenixComponentsDocsWeb, :controller

  def autocomplete_show(conn, _params) do
    options = [
      %{id: 1, name: "Mark"},
      %{id: 2, name: "Jacob"},
      %{id: 3, name: "Larry"}
    ]

    options_2 = [
      %{id: 1, name: "Thomas Edison"},
      %{id: 2, name: "Nikola"},
      %{id: 3, name: "Arnold"},
      %{id: 4, name: "Mark"},
      %{id: 5, name: "Bowen"},
      %{id: 6, name: "HigginsHigginsHigginsHigginsHigginsHigginsHiggins HigginsHigginsHiggins"},
      %{id: 7, name: "Marceline"},
      %{id: 8, name: "Blackwell"},
      %{id: 9, name: "Avila"},
      %{id: 10, name: "Leighton"},
      %{id: 11, name: "Kramer"}
    ]

    render(conn, page_title: "Autocomplete", options: options, options_2: options_2)
  end

  def badge_show(conn, _params) do
    render(conn, page_title: "Badge")
  end

  def button_show(conn, _params) do
    render(conn, page_title: "Button")
  end

  def checkbox_show(conn, _params) do
    render(conn, page_title: "Checkbox")
  end

  def checkbox_group_show(conn, _params) do
    options = [
      %{id: 1, name: "Buenos Aires"},
      %{id: 2, name: "Sydney"},
      %{id: 3, name: "San Francisco"},
      %{id: 4, name: "London"},
      %{id: 5, name: "Tokyo"}
    ]

    render(conn, page_title: "Checkbox Group", options: options)
  end

  def datepicker_show(conn, _params) do
    render(conn, page_title: "Datepicker")
  end

  def dropdown_show(conn, _params) do
    render(conn, page_title: "Dropdown")
  end

  def icon_show(conn, _params) do
    render(conn, page_title: "Icon")
  end

  def input_show(conn, _params) do
    render(conn, page_title: "Input")
  end

  def modal_show(conn, _params) do
    render(conn, page_title: "Modal")
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
