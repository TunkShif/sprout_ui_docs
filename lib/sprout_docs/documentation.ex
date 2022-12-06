defmodule SproutDocs.Documentation do
  @docs %{
    "getting-started" => %{
      title: "Getting Started",
      view: SproutDocsWeb.DocsHtml.GettingStarted,
      articles: [
        %{slug: "installation", title: "Installation"},
        %{slug: "styling_guide", title: "Styling Guide"},
        %{slug: "transition", title: "Transition"}
      ]
    },
    "components" => %{
      title: "Components",
      view: SproutDocsWeb.DocsHtml.Components,
      articles: []
    },
    "changelog" => %{
      title: "Chanegelog",
      view: SproutDocsWeb.DocsHtml.Changelog,
      articles: []
    }
  }

  def all, do: @docs

  def page_title(category), do: get_in(all(), [category, :title])

  def page_view(category), do: get_in(all(), [category, :view])
end
