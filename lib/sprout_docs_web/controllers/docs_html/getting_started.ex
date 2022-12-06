defmodule SproutDocsWeb.DocsHtml.GettingStarted do
  use SproutDocsWeb, :html
  use MDEEx

  embed_markdowns("getting_started/*")

  def index(assigns) do
    ~H"""
    <.installation />
    """
  end
end
