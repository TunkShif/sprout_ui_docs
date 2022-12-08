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
      articles: [
        %{slug: "accordion", title: "Accordion"},
        %{slug: "collapsible", title: "Collapsible"},
        %{slug: "dialog", title: "Dialog"},
        %{slug: "popover", title: "Popover"},
        %{slug: "switch", title: "Switch"},
        %{slug: "toggle", title: "Toggle"},
        %{slug: "tooltip", title: "Tooltip"}
      ]
    },
    "changelog" => %{
      title: "Chanegelog",
      view: SproutDocsWeb.DocsHtml.Changelog,
      articles: []
    }
  }

  def all, do: @docs

  def page_title(category), do: get_in(all(), [category, :title])

  def page_title(category, slug),
    do: get_in(all(), [category, :articles]) |> Enum.find(&(&1.slug == slug)) |> Map.get(:title)

  def page_view(category), do: get_in(all(), [category, :view])
end
