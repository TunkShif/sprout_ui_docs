defmodule MDEEx.Engine do
  @behaviour Phoenix.Template.Engine

  @impl true
  def compile(path, _name) do
    quote do
      require MDEEx.Engine
      MDEEx.Engine.compile(unquote(path))
    end
  end

  defmacro compile(path) do
    path
    |> File.read!()
    |> MDEEx.compile_string(line: 1, caller: __CALLER__)
  end
end
