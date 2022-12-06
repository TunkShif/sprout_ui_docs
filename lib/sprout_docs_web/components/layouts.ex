defmodule SproutDocsWeb.Layouts do
  use SproutDocsWeb, :html

  alias SproutDocs.Documentation

  embed_templates("layouts/*")

  attr :category, :string
  attr :page, :string

  def sidebar(assigns) do
    assigns = assign(assigns, categories: Documentation.all())

    # TODO: mobile layout
    # TODO: document search

    ~H"""
    <sidebar class="hidden lg:block fixed top-[72px] bottom-0 w-72 px-6 overflow-y-auto">
      <div class="sticky top-0">
        <div class="py-8">
          <button class="hidden w-full">Search</button>
        </div>
      </div>

      <nav>
        <ul class="space-y-4">
          <li>
            <.category_link current={@category} category="getting-started" title="Getting Started">
              <:icon>
                <Heroicons.bolt mini class="w-4 h-4" />
              </:icon>
            </.category_link>
          </li>
          <li>
            <.category_link current={@category} category="components" title="Components">
              <:icon>
                <Heroicons.squares_2x2 mini class="w-4 h-4" />
              </:icon>
            </.category_link>
          </li>
          <li>
            <.category_link current={@category} category="changelog" title="Changelog">
              <:icon>
                <Heroicons.document_text mini class="w-4 h-4" />
              </:icon>
            </.category_link>
          </li>
        </ul>

        <ul class="mt-8 border-l border-slate-900/10 dark:border-neutral-600 space-y-4">
          <li :for={article <- get_in(@categories, [@category, :articles])}>
            <a
              href={~p"/docs/#{@category}/#{article.slug}"}
              class="block border-l border-transparent data-[current]:border-emerald-500 pl-4 -ml-px text-sm data-[current]:font-medium data-[current]:text-emerald-500"
              data-current={@page == article.slug}
            >
              <%= article.title %>
            </a>
          </li>
        </ul>
      </nav>
    </sidebar>
    """
  end

  attr :current, :string
  attr :category, :string
  attr :title, :string
  slot :icon

  defp category_link(assigns) do
    ~H"""
    <a
      href={~p"/docs/#{@category}"}
      class="group flex items-center text-sm font-semibold data-[current]:text-emerald-500 hover:text-slate-900 dark:hover:text-neutral-300"
      data-current={@current == @category}
    >
      <div class={[
        "inline-flex justify-center items-center text-slate-500 dark:text-neutral-500 group-data-[current]:text-emerald-500",
        "mr-4 w-7 h-7 rounded-lg border border-slate-900/10 group-hover:border-slate-900/20 dark:shadow-neutral-700/40",
        "shadow-sm group-hover:shadow dark:border-neutral-700 dark:group-hover:border-neutral-600"
      ]}>
        <%= render_slot(@icon) %>
      </div>
      <%= @title %>
    </a>
    """
  end
end
