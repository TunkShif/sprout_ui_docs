defmodule SproutDocsWeb.Layouts do
  use SproutDocsWeb, :html

  alias SproutDocsWeb.Icons

  embed_templates("layouts/*")

  def header(assigns) do
    navigations = [
      %{name: "Documentation", route: "/docs"}
    ]

    assigns = assign(assigns, navigations: navigations)

    ~H"""
    <header class={[
      "sticky top-0 w-full flex-none z-50",
      "bg-white/95 dark:bg-neutral-800/75 border-b border-slate-900/10 dark:border-neutral-50/[0.06]",
      "backdrop-blur"
    ]}>
      <div class="mx-auto">
        <div class="px-12 py-4">
          <div class="relative flex items-center justify-between">
            <.link href="/" class="flex-none">
              <span class="sr-only">Sprout UI home page</span>
              <Icons.sprout_ui_logo
                class="w-auto h-8 text-slate-900 dark:text-white"
                aria-hidden="true"
              />
            </.link>
            <div class="flex items-center">
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
                <theme-toggle class="block group ml-4">
                  <button
                    data-part="trigger"
                    class="block text-slate-500 dark:text-neutral-500 hover:text-slate-600 dark:hover:text-neutral-400 transition-colors duration-200"
                  >
                    <span class="sr-only">theme toggle</span>
                    <span class="hidden group-data-[theme=dark]:inline">
                      <Heroicons.sun mini class="w-6 h-6" />
                    </span>
                    <span class="hidden group-data-[theme=light]:inline">
                      <Heroicons.moon mini class="w-6 h-6" />
                    </span>
                  </button>
                </theme-toggle>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
    """
  end
end
