defmodule SproutDocsWeb.PageHTML do
  use SproutDocsWeb, :html

  alias SproutUI.Display
  alias SproutDocsWeb.{Icons, Code}

  import Phoenix.HTML, only: [raw: 1]

  def index(assigns) do
    ~H"""
    <main>
      <.hero_section />

      <div class="my-20 md:my-24 space-y-20">
        <.feature_section>
          <:icon>
            <Heroicons.cube solid class="w-6 h-6 text-white" />
          </:icon>
          <:title>
            Renderless function components
          </:title>
          <:description>
            Sprout UI component does not render any visible HTML tags.
            It only controls user interactions and related UI states with an underlying <a
              href="https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements"
              target="_blank"
              class="underline"
            >custom element</a>.
            It is your responsibility to decide how to render the component,
            and all you need to do is just passing attributes to the tags you're rendering.
            You can see the flexibility of renderless component from the example code.
          </:description>
          <:content>
            <.code_example />
          </:content>
        </.feature_section>

        <.feature_section reverse>
          <:icon>
            <Heroicons.lifebuoy solid class="w-6 h-6 text-white" />
          </:icon>
          <:title>
            WAI-ARIA compliant components
          </:title>
          <:description>
            Sprout UI follows the
            <a href="https://www.w3.org/WAI/ARIA/apg/" target="_blank" class="underline">
              WAI-ARIA guide
            </a>
            to create accessible web experiences.
            It fully supports assistive technology like screen readers and keyboard navigations.
            Try using <.kbd key="Up" /> <.kbd key="Down" /> <.kbd key="Home" /> <.kbd key="End" />
            to navigate through the accordion items and using <.kbd key="Enter" /> or
            <.kbd key="Space" /> to expand/collapse the item.
          </:description>
          <:content>
            <.accordion_example />
          </:content>
        </.feature_section>
      </div>
    </main>
    """
  end

  defp hero_section(assigns) do
    ~H"""
    <div class="relative">
      <div class={[
        "absolute inset-0",
        "bg-[linear-gradient(5deg,#f7fee7_0%,#ffffff_100%)] dark:bg-[linear-gradient(5deg,#1c1917_0%,rgba(38,38,38,0.75)_100%)]",
        "border-b border-slate-200 dark:border-neutral-700 shadow-sm"
      ]}>
      </div>
      <.header />
      <section class="relative">
        <div class="px-4 md:px-8">
          <div class="max-w-5xl mx-auto py-20 md:py-28">
            <h1 class={[
              "text-4xl md:text-6xl font-extrabold tracking-tight",
              "text-slate-900 dark:text-white text-center md:text-left"
            ]}>
              <span class="bg-clip-text text-transparent bg-gradient-to-r from-emerald-500 to-green-600">
                Completely unstyled
              </span>
              and
              <span class="bg-clip-text text-transparent bg-gradient-to-r from-green-600 to-lime-600">
                fully accessible
              </span>
              UI components for Phoenix Framework.
            </h1>

            <p class={[
              "max-w-2xl mt-8 md:mt-12",
              "text-lg md:text-xl text-center md:text-left"
            ]}>
              Sprout UI provides a collection of common UI components,
              which are completely unstyled and are built following the WAI-ARIA guide,
              to help you easily build your own design systems and rich web applications with Phoenix and LiveView.
            </p>

            <div class="mt-12">
              <div class="flex md:space-x-6 justify-around md:justify-start">
                <.link
                  href="#"
                  class={[
                    "h-12 px-6 flex justify-center items-center font-semibold text-white rounded-md",
                    "bg-gradient-to-tr from-emerald-500 to-lime-500 hover:from-emerald-400 hover:to-lime-400 dark:hover:from-emerald-300 dark:hover:to-lime-300",
                    "focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-lime-400 dark:focus-visible:ring-offset-neutral-800"
                  ]}
                >
                  Get started
                </.link>
                <.link
                  href="https://github.com/TunkShif/sprout_ui"
                  class={[
                    "h-12 px-6 flex justify-between items-center font-semibold text-white rounded-md",
                    "bg-gray-800 dark:bg-black hover:bg-gray-700 dark:hover:bg-neutral-700",
                    "focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-black dark:focus-visible:ring-offset-neutral-800"
                  ]}
                >
                  <span class="mr-2"><Icons.github class="w-4 h-4 md:w-5 md:h-5" /></span> GitHub
                </.link>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
    """
  end

  attr :reverse, :boolean, default: false
  slot :icon, required: true
  slot :title, required: true
  slot :description, required: true
  slot :content, required: true

  defp feature_section(assigns) do
    ~H"""
    <section>
      <div class="px-8 md:px-12 ">
        <div class="mx-auto max-w-6xl">
          <div class="flex flex-col lg:grid lg:grid-cols-2 gap-12">
            <div>
              <div class="flex flex-col lg:flex-row lg:items-center">
                <span class="flex shrink-0 justify-center items-center w-12 h-12 shadow-md shadow-sky-400/40 rounded-md bg-[linear-gradient(120deg,#84fab0_0%,#8fd3f4_100%)]">
                  <%= render_slot(@icon) %>
                </span>
                <span class="block mt-4 md:mt-8 lg:mt-0 lg:ml-4 text-3xl text-slate-800 dark:text-neutral-50 font-extrabold tracking-tight">
                  <%= render_slot(@title) %>
                </span>
              </div>
              <div class="mt-6 text-slate-500 dark:text-neutral-400">
                <p class="leading-loose">
                  <%= render_slot(@description) %>
                </p>
              </div>
            </div>

            <div class={@reverse && "lg:order-first"}>
              <%= render_slot(@content) %>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  @dialog_example_code ~S"""
  <Overlay.dialog :let={api}>
    <button class="button" {api.trigger_attrs}>Open</button>

    <div {api.container_attrs}>
      <div class="backdrop" {api.backdrop_attrs}></div>
      <div class="dialog" {api.panel_attrs}>
        <h2 {api.title_attrs}>Dialog</h2>
        <p {api.description_attrs}>...</p>
        <buton class="button" {api.close_button}>&times;</button>
      </div>
    </div>
  </Overlay.dialog>
  """

  defp code_example(assigns) do
    assigns = assign(assigns, source: @dialog_example_code)

    ~H"""
    <Code.plain source={@source} language="heex" />
    """
  end

  defp accordion_example(assigns) do
    items = [
      %{
        title: "Mariners Apartment Complex",
        content: ~S"""
        You lose your way, just take my hand<br>
        You're lost at sea, then I'll command your boat to me again<br>
        Don't look too far, right where you are, that's where I am<br>
        """
      },
      %{
        title: "Stonemilker",
        content: ~S"""
        A juxtapositioning fate<br>
        Find our mutual coordinates<br>
        Moments of clarity are so rare<br>
        I better document this<br>
        At last the view is fierce<br>
        """
      },
      %{
        title: "青春",
        content: ~S"""
        给我一点遗憾　让我学学咏叹<br>
        给我一点灵感　抱怨这时代<br>
        我随风摇摆　我无聊自在<br>
        给我一点迷幻　借机使坏<br>
        """
      }
    ]

    assigns = assign(assigns, items: items)

    ~H"""
    <div class="">
      <Display.accordion :let={api} items={@items}>
        <div
          :for={item <- api.items}
          class="border-2 border-b-0 dark:border-neutral-500 last:border-b-2 first:rounded-t-lg last:rounded-b-lg"
          {item.container_attrs}
        >
          <h3>
            <button
              class={[
                "flex items-center justify-between w-full p-4 text-left",
                "ui-open:text-emerald-500 dark:ui-open:text-emerald-600 transition-colors",
                "ui-open:border-b-2 dark:border-neutral-500",
                "focus:bg-gray-100 hover:bg-gray-100 dark:focus:bg-neutral-700 dark:hover:bg-neutral-700",
                "focus:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-gray-400 focus-visible:rounded-lg",
                "dark:focus-visible:ring-neutral-900 dark:focus-visible:ring-offset-neutral-800"
              ]}
              {item.trigger_attrs}
            >
              <span><%= item.title %></span>
              <Heroicons.chevron_down class="w-5 h-5 ui-open:rotate-180 shrink-0 transition duration-300" />
            </button>
          </h3>
          <div
            class="overflow-hidden ui-open:animate-slide-down ui-closed:animate-slide-up"
            {item.panel_attrs}
          >
            <p class="p-4 font-light leading-loose text-gray-500 dark:text-neutral-400">
              <%= raw(item.content) %>
            </p>
          </div>
        </div>
      </Display.accordion>
    </div>
    """
  end
end
