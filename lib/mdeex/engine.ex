defmodule MDEEx.Engine do
  @behaviour Phoenix.Template.Engine

  @impl true
  def compile(path, _name) do
    path
    |> File.read!()
    |> MDEEx.compile_string(line: 1)
  end
end
