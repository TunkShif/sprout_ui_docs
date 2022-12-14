defmodule MDEEx do
  import Phoenix.HTML

  defmacro __using__(_) do
    quote do
      require MDEEx
      import MDEEx, except: [compile_string: 2]
    end
  end

  defmacro sigil_M({:<<>>, meta, [expr]}, []) do
    unless Macro.Env.has_var?(__CALLER__, {:assigns, nil}) do
      raise "~M requires a variable named \"assigns\" to exist and be set to a map"
    end

    options = [
      file: __CALLER__.file,
      line: __CALLER__.line + 1,
      caller: __CALLER__,
      indentation: meta[:indentation] || 0
    ]

    compile_string(expr, options)
  end

  defmacro embed_markdowns(pattern, opts \\ []) do
    quote do
      Phoenix.Template.compile_all(
        &MDEEx.__embed__/1,
        Path.expand(unquote(opts)[:root] || __DIR__, __DIR__),
        unquote(pattern)
      )
    end
  end

  def __embed__(path), do: path |> Path.basename() |> Path.rootname(".html.mdx")

  def compile_string(source, options \\ []) do
    options = Keyword.merge(options, engine: Phoenix.LiveView.HTMLEngine)

    [:makeup_elixir, :makeup_html, :makeup_eex, :makeup_js]
    |> Enum.each(&Application.ensure_all_started(&1))

    source =
      Earmark.as_html!(source,
        escape: false,
        registered_processors: {"code", &transform_code_block/1}
      )
      |> NimblePublisher.Highlighter.highlight()

    EEx.compile_string(source, options)
  end

  defp transform_code_block({"code", attrs, [source], meta}) do
    escaped = source |> html_escape() |> safe_to_string()
    {:replace, {"code", attrs, [escaped], meta}}
  end
end
