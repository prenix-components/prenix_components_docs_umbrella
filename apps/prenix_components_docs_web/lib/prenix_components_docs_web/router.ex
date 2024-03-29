defmodule PrenixComponentsDocsWeb.Router do
  use PrenixComponentsDocsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PrenixComponentsDocsWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :docs do
    plug :browser
    plug :put_layout, html: {PrenixComponentsDocsWeb.Layouts, :docs}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PrenixComponentsDocsWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/docs", PrenixComponentsDocsWeb do
    pipe_through :docs

    get "/accordion", DocsController, :accordion_show
    get "/alert", DocsController, :alert_show
    get "/autocomplete", DocsController, :autocomplete_show
    get "/avatar", DocsController, :avatar_show
    get "/badge", DocsController, :badge_show
    get "/button", DocsController, :button_show
    get "/card", DocsController, :card_show
    get "/checkbox", DocsController, :checkbox_show
    get "/checkbox_group", DocsController, :checkbox_group_show
    get "/chip", DocsController, :chip_show
    get "/collapse", DocsController, :collapse_show
    get "/datepicker", DocsController, :datepicker_show
    get "/dropdown", DocsController, :dropdown_show
    get "/icon", DocsController, :icon_show
    get "/input", DocsController, :input_show
    get "/link", DocsController, :link_show
    get "/modal", DocsController, :modal_show
    get "/offcanvas", DocsController, :offcanvas_show
    get "/select", DocsController, :select_show
    get "/spinner", DocsController, :spinner_show
    get "/table", DocsController, :table_show
    get "/theme_switcher", DocsController, :theme_switcher_show
    get "/toast", DocsController, :toast_show
    get "/tooltip", DocsController, :tooltip_show
  end

  # Other scopes may use custom stacks.
  # scope "/api", PrenixComponentsDocsWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:prenix_components_docs_web, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PrenixComponentsDocsWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
