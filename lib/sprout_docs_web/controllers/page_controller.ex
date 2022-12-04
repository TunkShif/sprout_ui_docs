defmodule SproutDocsWeb.PageController do
  use SproutDocsWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false, page_title: "Sprout UI", no_page_title_suffix: true)
  end
end
