defmodule SproutDocsWeb.CoreComponents do
  @moduledoc """
  Provides core UI components.
  """
  use Phoenix.Component

  alias SproutDocsWeb.Icons
  alias Phoenix.LiveView.JS
  import SproutDocsWeb.Gettext

  attr :class, :string, default: ""

  def theme_toggle(assigns) do
    ~H"""
    <button
      is="theme-toggle"
      class={[
        @class,
        "block text-slate-500 dark:text-neutral-500 hover:text-slate-600 dark:hover:text-neutral-400 transition-colors duration-200"
      ]}
    >
      <span class="sr-only">theme toggle</span>
      <span class="hidden dark:inline">
        <Heroicons.sun mini class="w-6 h-6" />
      </span>
      <span class="dark:hidden inline">
        <Heroicons.moon mini class="w-6 h-6" />
      </span>
    </button>
    """
  end

  attr :rest, :global

  def header(assigns) do
    navigations = [
      %{name: "Documentation", route: "/docs/getting-started"}
    ]

    assigns = assign(assigns, navigations: navigations)

    ~H"""
    <header {@rest}>
      <div class="mx-auto h-[72px]">
        <div class="px-4 md:px-12 py-4">
          <div class="relative flex items-center justify-between">
            <.link href="/" class="flex-none">
              <span class="sr-only">Sprout UI home page</span>
              <Icons.sprout_ui_logo
                class="w-auto h-5 md:h-8 text-slate-900 dark:text-white"
                aria-hidden="true"
              />
            </.link>

            <div class="hidden md:flex items-center">
              <nav class="text-sm font-semibold hover:text-emerald-500 transition-colors duration-200">
                <ul class="flex space-x-8">
                  <li :for={navigation <- @navigations}>
                    <.link href={navigation.route}><%= navigation.name %></.link>
                  </li>
                </ul>
              </nav>
              <div class="flex items-center ml-6 pl-6 border-l border-slate-200 dark:border-neutral-500">
                <.link
                  href="https://github.com/TunkShif/sprout_ui"
                  class="block text-slate-500 dark:text-neutral-500 hover:text-slate-600 dark:hover:text-neutral-400 transition-colors duration-200"
                >
                  <span class="sr-only">Sprout UI repository on GitHub</span>
                  <Icons.github class="w-5 h-5" aria-hidden="true" />
                </.link>
                <.theme_toggle class="ml-4" />
              </div>
            </div>

            <div class="md:hidden flex items-center">
              <.theme_toggle />
            </div>
          </div>
        </div>
      </div>
    </header>
    """
  end

  def footer(assigns) do
    ~H"""
    <footer class="my-12">
      <div>
        <div class="text-xs text-center text-slate-500 dark:text-neutral-400">
          Built by <a href="https://tunkshif.one" class="underline">Tristan Yang</a>
        </div>
        <div class="mt-6 flex justify-center items-center space-x-8">
          <a
            href="https://github.com/TunkShif"
            class="block text-slate-500 dark:text-neutral-500 hover:text-slate-600 dark:hover:text-neutral-400 transition-colors duration-200"
          >
            <span class="sr-only">link to github profile</span>
            <Icons.github class="w-5 h-5" />
          </a>
          <a
            href="https://twitter.com/TunkShif"
            class="block text-slate-500 dark:text-neutral-500 hover:text-slate-600 dark:hover:text-neutral-400 transition-colors duration-200"
          >
            <span class="sr-only">link to twitter page</span>
            <Icons.twitter class="w-5 h-5" />
          </a>
          <a
            href="mailto:tunkshfi@foxmail.com"
            class="block text-slate-500 dark:text-neutral-500 hover:text-slate-600 dark:hover:text-neutral-400 transition-colors duration-200"
          >
            <span class="sr-only">link to email</span>
            <Heroicons.envelope solid class="w-5 h-5" />
          </a>
        </div>
      </div>
    </footer>
    """
  end

  @doc """
  Renders flash notices.

  ## Examples

      <.flash kind={:info} flash={@flash} />
      <.flash kind={:info} phx-mounted={show("#flash")}>Welcome Back!</.flash>
  """
  attr :id, :string, default: "flash", doc: "the optional id of flash container"
  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"
  attr :title, :string, default: nil
  attr :kind, :atom, values: [:info, :error], doc: "used for styling and flash lookup"
  attr :autoshow, :boolean, default: true, doc: "whether to auto show the flash on mount"
  attr :close, :boolean, default: true, doc: "whether the flash can be closed"
  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the flash container"

  slot :inner_block, doc: "the optional inner block that renders the flash message"

  def flash(assigns) do
    ~H"""
    <div
      :if={msg = render_slot(@inner_block) || Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      phx-mounted={@autoshow && show("##{@id}")}
      phx-click={JS.push("lv:clear-flash", value: %{key: @kind}) |> hide("#flash")}
      role="alert"
      class={[
        "fixed hidden top-2 right-2 w-80 sm:w-96 z-50 rounded-lg p-3 shadow-md shadow-zinc-900/5 ring-1",
        @kind == :info && "bg-emerald-50 text-emerald-800 ring-emerald-500 fill-cyan-900",
        @kind == :error && "bg-rose-50 p-3 text-rose-900 shadow-md ring-rose-500 fill-rose-900"
      ]}
      {@rest}
    >
      <p :if={@title} class="flex items-center gap-1.5 text-[0.8125rem] font-semibold leading-6">
        <Heroicons.information_circle :if={@kind == :info} mini class="h-4 w-4" />
        <Heroicons.exclamation_circle :if={@kind == :error} mini class="h-4 w-4" />
        <%= @title %>
      </p>
      <p class="mt-2 text-[0.8125rem] leading-5"><%= msg %></p>
      <button
        :if={@close}
        type="button"
        class="group absolute top-2 right-1 p-2"
        aria-label={gettext("close")}
      >
        <Heroicons.x_mark solid class="h-5 w-5 stroke-current opacity-40 group-hover:opacity-70" />
      </button>
    </div>
    """
  end

  def show(js \\ %JS{}, selector) do
    JS.show(js,
      to: selector,
      transition:
        {"transition-all transform ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"}
    )
  end

  def hide(js \\ %JS{}, selector) do
    JS.hide(js,
      to: selector,
      time: 200,
      transition:
        {"transition-all transform ease-in duration-200",
         "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
  end

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # When using gettext, we typically pass the strings we want
    # to translate as a static argument:
    #
    #     # Translate "is invalid" in the "errors" domain
    #     dgettext("errors", "is invalid")
    #
    #     # Translate the number of files with plural rules
    #     dngettext("errors", "1 file", "%{count} files", count)
    #
    # Because the error messages we show in our forms and APIs
    # are defined inside Ecto, we need to translate them dynamically.
    # This requires us to call the Gettext module passing our gettext
    # backend as first argument.
    #
    # Note we use the "errors" domain, which means translations
    # should be written to the errors.po file. The :count option is
    # set by Ecto and indicates we should also apply plural rules.
    if count = opts[:count] do
      Gettext.dngettext(SproutDocsWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(SproutDocsWeb.Gettext, "errors", msg, opts)
    end
  end

  @doc """
  Translates the errors for a field from a keyword list of errors.
  """
  def translate_errors(errors, field) when is_list(errors) do
    for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
  end
end
