defmodule SproutDocsWeb.DocsController do
  use SproutDocsWeb, :controller

  alias SproutDocs.Documentation

  def index(conn, %{"category" => category}) do
    conn = put_view(conn, html: Documentation.page_view(category))

    case category do
      "getting-started" ->
        redirect(conn, to: ~p"/docs/getting-started/installation")

      _ ->
        render(conn, :index, page_title: Documentation.page_title(category), category: category)
    end
  end

  def show(conn, %{"category" => category, "page" => page}) do
    conn
    |> put_view(html: Documentation.page_view(category))
    |> render(String.to_existing_atom(page),
      page_title: Documentation.page_title(category, page),
      category: category,
      page: page
    )
  end
end
