defmodule SproutDocsWeb.Router do
  use SproutDocsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SproutDocsWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SproutDocsWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/docs/:category", DocsController, :index
    get "/docs/:category/:page", DocsController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", SproutDocsWeb do
  #   pipe_through :api
  # end
end
