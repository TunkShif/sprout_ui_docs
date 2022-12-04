defmodule Makeup.Styles.HTML.OneDarkStyle do
  @moduledoc false

  @styles %{
    :token => "#ABB2BF",
    :punctuation => "#ABB2BF",
    :punctuation_marker => "#ABB2BF",
    :keyword => "#C678DD",
    :keyword_constant => "#E5C07B",
    :keyword_declaration => "#C678DD",
    :keyword_namespace => "#C678DD",
    :keyword_reserved => "#C678DD",
    :keyword_type => "#E5C07B",
    :name => "#E06C75",
    :name_attribute => "#E06C75",
    :name_builtin => "#E5C07B",
    :name_class => "#E5C07B",
    :name_function => "bold #61AFEF",
    :name_function_magic => "bold #56B6C2",
    :name_other => "#E06C75",
    :name_tag => "#E06C75",
    :name_decorator => "#61AFEF",
    :string => "#98C379",
    :number => "#D19A66",
    :operator => "#56B6C2",
    :comment => "#7F848E"
  }

  alias Makeup.Styles.HTML.Style

  @style_struct Style.make_style(
                  short_name: "onedark",
                  long_name: "OneDark Style",
                  background_color: "#282C34",
                  highlight_color: "#49483e",
                  styles: @styles
                )

  def style() do
    @style_struct
  end
end
