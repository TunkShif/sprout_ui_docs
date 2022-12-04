defmodule SproutDocsWeb.Code do
  use Phoenix.Component

  import Phoenix.HTML, only: [raw: 1]

  attr :source, :string, required: true
  attr :language, :string, default: nil
  attr :rest, :global

  def plain(assigns) do
    lexer =
      case assigns.language do
        "heex" -> Makeup.Lexers.HEExLexer
        "html" -> Makeup.Lexers.HEExLexer
        _ -> Makeup.Lexers.ElixirLexer
      end

    assigns = assign(assigns, lexer: lexer)

    ~H"""
    <div {@rest}>
      <div class="rounded-md shadow-sm overflow-hidden">
        <%= raw(Makeup.highlight(@source, lexer: @lexer)) %>
      </div>
    </div>
    """
  end
end
