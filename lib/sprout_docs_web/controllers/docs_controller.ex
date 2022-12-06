defmodule SproutDocsWeb.DocsController do
  use SproutDocsWeb, :controller

  @categories %{
    "getting-started" => %{
      title: "Getting Started",
      view: SproutDocsWeb.DocsHtml.GettingStarted
    },
    "components" => %{
      title: "Components",
      view: SproutDocsWeb.DocsHtml.Components
    },
    "changelog" => %{
      title: "Chanegelog",
      view: SproutDocsWeb.DocsHtml.Changelog
    }
  }

  def index(conn, %{"category" => category}) do
    conn
    |> put_view(html: page_view(category))
    |> render(:index, page_title: page_title(category))
  end

  def show(conn, %{"category" => category, "page" => page}) do
    conn
    |> put_view(html: page_view(category))
    |> render(String.to_existing_atom(page), page_title: page_title(category))
  end

  defp categories, do: @categories
  defp page_title(category), do: get_in(categories(), [category, :title])
  defp page_view(category), do: get_in(categories(), [category, :view])
end
