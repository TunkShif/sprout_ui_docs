defmodule SproutDocsWeb.DocsHtml.Components do
  use SproutDocsWeb, :html
  use MDEEx

  alias SproutDocs.Documentation
  alias SproutUI.{Display, Input, Overlay}
  import SproutUI.Helper

  embed_templates("components/*")
  embed_markdowns("components/*")

  attr :background, :string, default: "bg-[linear-gradient(120deg,#a1c4fd_0%,#c2e9fb_100%)]"
  attr :source, :string
  attr :class, :string, default: ""
  attr :rest, :global
  slot :inner_block

  defp code_example(assigns) do
    id = unique_id()

    assigns = assign(assigns, id: id)

    ~H"""
    <div class={["not-prose relative rounded-md", @class]} {@rest}>
      <div class={["relative grid place-items-center rounded-t-md", @background]}>
        <div class="py-12">
          <%= render_slot(@inner_block) %>
        </div>
      </div>

      <div
        id={"code-#{@id}"}
        class={[
          "bg-neutral-800 dark:bg-[#131313] rounded-b-md scrollbar",
          "h-[180px] aria-expanded:h-[580px] overflow-hidden aria-expanded:overflow-y-auto"
        ]}
        aria-expanded="false"
      >
        <div class="text-sm scrollbar">
          <.code_block source={@source} language="elixir" />
        </div>

        <div class="absolute w-32 mx-auto inset-x-0 bottom-2">
          <Input.toggle
            on_toggle_on={JS.set_attribute({"aria-expanded", "true"}, to: "#code-#{@id}")}
            on_toggle_off={JS.set_attribute({"aria-expanded", "false"}, to: "#code-#{@id}")}
            role="button"
            class={[
              "inline-block px-2 py-0.5 bg-white hover:bg-gray-100 dark:bg-neutral-700 dark:hover:bg-neutral-600",
              "font-medium text-sm text-slate-800 dark:text-neutral-400 rounded-sm"
            ]}
            aria-controls={"code-#{@id}"}
          >
            <span class="ui-on:hidden"> Expand Code </span>
            <span class="ui-off:hidden"> Collapse Code </span>
          </Input.toggle>
        </div>
      </div>
    </div>
    """
  end

  @accordion_example_code ~S'''
  items = [
    %{
      title: "Description",
      content: ~S"""
      Elixir is a functional, concurrent, general-purpose programming language that
      runs on the BEAM virtual machine which is also used to implement the Erlang programming language.
      """
    },
    %{
      title: "Popularity",
      content: ~S"""
      According to the Stack Overflow Developer Survey, since its release back in 2011,
      Elixir has become the most loved programming language.
      """
    },
    %{
      title: "Features",
      content: ~S"""
      Scalability, fault-tolerance, interactive development, metaprogramming
      """
    }
  ]

  assigns = assign(assigns, items: items)

  <Display.accordion
    :let={api}
    class="block w-64 md:w-96 bg-white rounded-md overflow-hidden"
    items={@items}
  >
    <div :for={item <- api.items} {item.container_attrs}>
      <h2>
        <button
          class={[
            "flex items-center justify-between w-full p-4 text-sm text-slate-700 text-left ui-open:font-medium",
            "border border-gray-200 hover:bg-gray-100"
          ]}
          {item.trigger_attrs}
        >
          <span><%= item.title %></span>
          <Heroicons.chevron_down class="w-4 h-4 ui-open:rotate-180 shrink-0 transition duration-300" />
        </button>
      </h2>

      <div
        class="overflow-hidden ui-open:animate-slide-down ui-closed:animate-slide-up"
        {item.panel_attrs}
      >
        <p class="px-4 py-2 text-sm text-gray-500">
          <%= item.content %>
        </p>
      </div>
    </div>
  </Display.accordion>
  '''

  defp accordion_example(assigns) do
    items = [
      %{
        title: "Description",
        content: ~S"""
        Elixir is a functional, concurrent, general-purpose programming language that
        runs on the BEAM virtual machine which is also used to implement the Erlang programming language.
        """
      },
      %{
        title: "Popularity",
        content: ~S"""
        According to the Stack Overflow Developer Survey, since its release back in 2011,
        Elixir has become the most loved programming language.
        """
      },
      %{
        title: "Features",
        content: ~S"""
        Scalability, fault-tolerance, interactive development, metaprogramming
        """
      }
    ]

    assigns = assign(assigns, source: @accordion_example_code, items: items)

    ~H"""
    <.code_example source={@source}>
      <Display.accordion
        :let={api}
        class="block w-64 md:w-96 bg-white rounded-md overflow-hidden"
        items={@items}
      >
        <div :for={item <- api.items} {item.container_attrs}>
          <h2>
            <button
              class={[
                "flex items-center justify-between w-full p-4 text-sm text-slate-700 text-left ui-open:font-medium",
                "border border-gray-200 hover:bg-gray-100"
              ]}
              {item.trigger_attrs}
            >
              <span><%= item.title %></span>
              <Heroicons.chevron_down class="w-4 h-4 ui-open:rotate-180 shrink-0 transition duration-300" />
            </button>
          </h2>

          <div
            class="overflow-hidden ui-open:animate-slide-down ui-closed:animate-slide-up"
            {item.panel_attrs}
          >
            <p class="px-4 py-2 text-sm text-gray-500">
              <%= item.content %>
            </p>
          </div>
        </div>
      </Display.accordion>
    </.code_example>
    """
  end

  @collapsible_example_code ~S"""
  <Display.collapsible :let={api} class="block w-64 md:w-72">
    <div class="flex justify-between items-center">
      <div class="text-sm text-white">You have 3 new notifications</div>
      <button
        {api.trigger_attrs}
        class="ml-4 w-[22px] h-[22px] flex justify-center items-center bg-white rounded-full"
        aria-label="toggle notification button"
      >
        <span class="ui-open:rotate-45 transition-transform duration-200 text-slate-700">
          <Heroicons.plus mini class="w-4 h-4" />
        </span>
      </button>
    </div>

    <div class="mt-2">
      <div class="mb-2 px-3 py-2 bg-white text-sm text-slate-700 rounded-[4px] shadow">
        Someone mentioned you.
      </div>
      <ul
        class="overflow-hidden ui-open:animate-slide-down ui-closed:animate-slide-up"
        {api.panel_attrs}
      >
        <li class="mb-2">
          <div class="px-3 py-2 bg-white text-sm text-slate-700 rounded-[4px] shadow">
            You have a new email.
          </div>
        </li>
        <li>
          <div class="px-3 py-2 bg-white text-sm text-slate-700 rounded-[4px] shadow">
            You have a text message.
          </div>
        </li>
      </ul>
    </div>
  </Display.collapsible>
  """

  defp collapsible_example(assigns) do
    assigns = assign(assigns, source: @collapsible_example_code)

    ~H"""
    <.code_example source={@source} background="bg-[linear-gradient(to_top,#a3bded_0%,#6991c7_100%)]">
      <Display.collapsible :let={api} class="block w-64 md:w-72">
        <div class="flex justify-between items-center">
          <div class="text-sm text-white">You have 3 new notifications</div>
          <button
            {api.trigger_attrs}
            class="ml-4 w-[22px] h-[22px] flex justify-center items-center bg-white rounded-full"
            aria-label="toggle notification button"
          >
            <span class="ui-open:rotate-45 transition-transform duration-200 text-slate-700">
              <Heroicons.plus mini class="w-4 h-4" />
            </span>
          </button>
        </div>

        <div class="mt-2">
          <div class="mb-2 px-3 py-2 bg-white text-sm text-slate-700 rounded-[4px] shadow">
            Someone mentioned you.
          </div>
          <ul
            class="overflow-hidden ui-open:animate-slide-down ui-closed:animate-slide-up"
            {api.panel_attrs}
          >
            <li class="mb-2">
              <div class="px-3 py-2 bg-white text-sm text-slate-700 rounded-[4px] shadow">
                You have a new email.
              </div>
            </li>
            <li>
              <div class="px-3 py-2 bg-white text-sm text-slate-700 rounded-[4px] shadow">
                You have a text message.
              </div>
            </li>
          </ul>
        </div>
      </Display.collapsible>
    </.code_example>
    """
  end

  @toggle_example_code ~S"""
  <div class="flex flex-col justify-center items-center">
    <Input.toggle
      on_toggle_on={
        JS.show(
          to: "#toggle-text",
          transition: {"ease-in-out duration-300", "opacity-0", "opacity-100"}
        )
      }
      on_toggle_off={
        JS.hide(
          to: "#toggle-text",
          transition: {"ease-in-out duration-300", "opacity-100", "opacity-0"}
        )
      }
      class={[
        "w-8 h-8 flex justify-center items-center text-slate-600 rounded-sm",
        "bg-white hover:bg-gray-100 ui-on:bg-gray-100 shadow-sm"
      ]}
    >
      <span class="sr-only">toggle text button</span>
      <Heroicons.paper_airplane mini class="w-4 h-4" />
    </Input.toggle>
    <div class="mt-4 h-8">
      <span id="toggle-text" class="hidden text-slate-700">Hi, there!</span>
    </div>
  </div>
  """

  defp toggle_example(assigns) do
    assigns = assign(assigns, source: @toggle_example_code)

    ~H"""
    <.code_example source={@source}>
      <div class="flex flex-col justify-center items-center">
        <Input.toggle
          on_toggle_on={
            JS.show(
              to: "#toggle-text",
              transition: {"ease-in-out duration-300", "opacity-0", "opacity-100"}
            )
          }
          on_toggle_off={
            JS.hide(
              to: "#toggle-text",
              transition: {"ease-in-out duration-300", "opacity-100", "opacity-0"}
            )
          }
          class={[
            "w-8 h-8 flex justify-center items-center text-slate-600 rounded-sm",
            "bg-white hover:bg-gray-100 ui-on:bg-gray-100 shadow-sm"
          ]}
        >
          <span class="sr-only">toggle text button</span>
          <Heroicons.paper_airplane mini class="w-4 h-4" />
        </Input.toggle>
        <div class="mt-4 h-8">
          <span id="toggle-text" class="hidden text-slate-700">Hi, there!</span>
        </div>
      </div>
    </.code_example>
    """
  end

  @switch_example_code ~S"""
  <Input.switch
    :let={api}
    on_checked={JS.set_attribute({"data-dark", "true"}, to: "#code-example-#{@id}")}
    on_unchecked={JS.remove_attribute("data-dark", to: "#code-example-#{@id}")}
  >
    <button
      class={[
        "relative inline-flex flex-shrink-0 items-center h-[24px] w-[44px]",
        "bg-gray-100 group-data-[dark]:bg-slate-700 rounded-full",
        "ring-1 ring-inset ring-gray-100 group-data-[dark]:ring-white/10",
        "cursor-pointer transition duration-200 ease-in-out"
      ]}
      {api.track_attrs}
    >
      <span class="sr-only">theme toggle</span>
      <span
        class={[
          "inline-flex justify-center items-center pointer-events-none h-[22px] w-[22px]",
          "bg-white group-data-[dark]:bg-slate-800 rounded-full shadow-lg ring-0",
          "transform transition duration-200 ease-in-out ui-checked:translate-x-5"
        ]}
        {api.thumb_attrs}
      >
        <Heroicons.sun mini class="ui-checked:hidden w-3 h-3 text-gray-500" />
        <Heroicons.moon mini class="ui-unchecked:hidden w-3 h-3 text-gray-300" />
      </span>
    </button>
  </Input.switch>
  """

  defp switch_example(assigns) do
    id = unique_id()
    assigns = assign(assigns, id: id, source: @switch_example_code)

    ~H"""
    <.code_example
      id={"code-example-#{@id}"}
      source={@source}
      class="group"
      background="bg-[linear-gradient(120deg,#a1c4fd_0%,#c2e9fb_100%)] group-data-[dark]:bg-[linear-gradient(45deg,#8baaaa_0%,#ae8b9c_100%)]"
    >
      <Input.switch
        :let={api}
        on_checked={JS.set_attribute({"data-dark", "true"}, to: "#code-example-#{@id}")}
        on_unchecked={JS.remove_attribute("data-dark", to: "#code-example-#{@id}")}
      >
        <button
          class={[
            "relative inline-flex flex-shrink-0 items-center h-[24px] w-[44px]",
            "bg-gray-100 group-data-[dark]:bg-slate-700 rounded-full",
            "ring-1 ring-inset ring-gray-100 group-data-[dark]:ring-white/10",
            "cursor-pointer transition duration-200 ease-in-out"
          ]}
          {api.track_attrs}
        >
          <span class="sr-only">theme toggle</span>
          <span
            class={[
              "inline-flex justify-center items-center pointer-events-none h-[22px] w-[22px]",
              "bg-white group-data-[dark]:bg-slate-800 rounded-full shadow-lg ring-0",
              "transform transition duration-200 ease-in-out ui-checked:translate-x-5"
            ]}
            {api.thumb_attrs}
          >
            <Heroicons.sun mini class="ui-checked:hidden w-3 h-3 text-gray-500" />
            <Heroicons.moon mini class="ui-unchecked:hidden w-3 h-3 text-gray-300" />
          </span>
        </button>
      </Input.switch>
    </.code_example>
    """
  end

  @tooltip_example_code ~S"""
  <Overlay.tooltip
    :let={api}
    placement="top"
    open_delay={200}
    close_delay={300}
    offset={16}
  >
    <button
      class={[
        "grid place-items-center h-24 w-24 font-medium",
        "border-2 text-white border-white border-dashed rounded",
        "cursor-pointer focus:outline-none focus:ring-2 focus:ring-white"
      ]}
      {api.trigger_attrs}
    >
      hover me
    </button>
    <div
      class="absolute w-max px-2 py-1 bg-slate-700 text-sm text-white font-medium rounded"
      data-transition
      data-enter="transition duration-300"
      data-enter-from="opacity-0"
      data-enter-to="opacity-100"
      data-leave="transition duration-300"
      data-leave-from="opacity-100"
      data-leave-to="opacity-0"
      {api.container_attrs}
    >
      I'm a Tooltip
      <div class="absolute w-2 h-2 bg-slate-700 rotate-45" {api.arrow_attrs}></div>
    </div>
  </Overlay.tooltip>
  """

  defp tooltip_example(assigns) do
    assigns = assign(assigns, source: @tooltip_example_code)

    ~H"""
    <.code_example source={@source} background="bg-[linear-gradient(to_top,#a3bded_0%,#6991c7_100%)]">
      <Overlay.tooltip :let={api} placement="top" open_delay={200} close_delay={300} offset={16}>
        <button
          class={[
            "grid place-items-center h-24 w-24 font-medium",
            "border-2 text-white border-white border-dashed rounded",
            "cursor-pointer focus:outline-none focus:ring-2 focus:ring-white"
          ]}
          {api.trigger_attrs}
        >
          hover me
        </button>
        <div
          class="absolute w-max px-2 py-1 bg-slate-700 text-sm text-white font-medium rounded"
          data-transition
          data-enter="transition duration-300"
          data-enter-from="opacity-0"
          data-enter-to="opacity-100"
          data-leave="transition duration-300"
          data-leave-from="opacity-100"
          data-leave-to="opacity-0"
          {api.container_attrs}
        >
          I'm a Tooltip
          <div class="absolute w-2 h-2 bg-slate-700 rotate-45" {api.arrow_attrs}></div>
        </div>
      </Overlay.tooltip>
    </.code_example>
    """
  end

  @popover_example_code ~S"""
  <Overlay.popover :let={api} offset={12}>
    <button
      class={[
        "w-8 h-8 flex justify-center items-center text-slate-600 rounded-sm",
        "bg-white hover:bg-gray-100 shadow-sm"
      ]}
      {api.trigger_attrs}
    >
      <span class="sr-only">toggle edit name popover button</span>
      <Heroicons.pencil_square mini class="w-4 h-4" />
    </button>
    <div
      class="absolute z-10 max-w-sm"
      data-transition
      data-enter="transition duration-300"
      data-enter-from="opacity-0"
      data-enter-to="opacity-100"
      data-leave="transition duration-300"
      data-leave-from="opacity-100"
      data-leave-to="opacity-0"
      {api.panel_attrs}
    >
      <div class="overflow-hidden rounded-[5px] w-80 shadow-sm">
        <div class="relative bg-white px-6 py-4 flex flex-col">
          <div class="text-slate-700">
            <div>
              <label class="font-medium">First name:</label>
              <input
                type="text"
                class={[
                  "mt-1 block w-full rounded-md border-gray-300 shadow-sm",
                  "focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                ]}
              />
            </div>
            <div class="mt-2">
              <label class="font-medium">First name:</label>
              <input
                type="text"
                class={[
                  "mt-1 block w-full rounded-md border-gray-300 shadow-sm",
                  "focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                ]}
              />
            </div>
          </div>
          <div class="mt-4 flex justify-end space-x-4">
            <button
              class={[
                "flex justify-center items-center px-3 py-1.5 text-slate-600 font-semibold rounded-md",
                "bg-white hover:bg-gray-100 border border-gray-300 shadow-sm"
              ]}
              phx-click={api.close_popover_js}
            >
              Cancel
            </button>
            <button
              class={[
                "flex justify-center items-center px-3 py-1.5 text-gray-50 font-semibold rounded-md",
                "bg-sky-500/40 border border-gray-300 shadow-sm cursor-not-allowed"
              ]}
              disabled
            >
              Save
            </button>
          </div>
          <button
            class="absolute flex justify-center items-center top-1 right-1 w-6 h-6 hover:bg-gray-100 rounded-md"
            {api.close_button_attrs}
          >
            <Heroicons.x_mark mini class="w-5 h-5 text-slate-600" />
          </button>
        </div>
      </div>
    </div>
  </Overlay.popover>
  """

  defp popover_example(assigns) do
    assigns = assign(assigns, source: @popover_example_code)

    ~H"""
    <.code_example source={@source}>
      <Overlay.popover :let={api} offset={12}>
        <button
          class={[
            "w-8 h-8 flex justify-center items-center text-slate-600 rounded-sm",
            "bg-white hover:bg-gray-100 shadow-sm"
          ]}
          {api.trigger_attrs}
        >
          <span class="sr-only">toggle edit name popover button</span>
          <Heroicons.pencil_square mini class="w-4 h-4" />
        </button>
        <div
          class="absolute z-10 max-w-sm"
          data-transition
          data-enter="transition duration-300"
          data-enter-from="opacity-0"
          data-enter-to="opacity-100"
          data-leave="transition duration-300"
          data-leave-from="opacity-100"
          data-leave-to="opacity-0"
          {api.panel_attrs}
        >
          <div class="overflow-hidden rounded-[5px] w-80 shadow-sm">
            <div class="relative bg-white px-6 py-4 flex flex-col">
              <div class="text-slate-700">
                <div>
                  <label class="font-medium">First name:</label>
                  <input
                    type="text"
                    class={[
                      "mt-1 block w-full rounded-md border-gray-300 shadow-sm",
                      "focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                    ]}
                  />
                </div>
                <div class="mt-2">
                  <label class="font-medium">First name:</label>
                  <input
                    type="text"
                    class={[
                      "mt-1 block w-full rounded-md border-gray-300 shadow-sm",
                      "focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50"
                    ]}
                  />
                </div>
              </div>
              <div class="mt-4 flex justify-end space-x-4">
                <button
                  class={[
                    "flex justify-center items-center px-3 py-1.5 text-slate-600 font-semibold rounded-md",
                    "bg-white hover:bg-gray-100 border border-gray-300 shadow-sm"
                  ]}
                  phx-click={api.close_popover_js}
                >
                  Cancel
                </button>
                <button
                  class={[
                    "flex justify-center items-center px-3 py-1.5 text-gray-50 font-semibold rounded-md",
                    "bg-sky-500/40 border border-gray-300 shadow-sm cursor-not-allowed"
                  ]}
                  disabled
                >
                  Save
                </button>
              </div>
              <button
                class="absolute flex justify-center items-center top-1 right-1 w-6 h-6 hover:bg-gray-100 rounded-md"
                {api.close_button_attrs}
              >
                <Heroicons.x_mark mini class="w-5 h-5 text-slate-600" />
              </button>
            </div>
          </div>
        </div>
      </Overlay.popover>
    </.code_example>
    """
  end

  @dialog_example_code ~S"""
  <Overlay.dialog :let={api}>
    <button
      class={[
        "block px-3 py-2 text-center text-sm text-slate-700 font-medium rounded-md",
        "bg-white hover:bg-gray-100 focus-visible:ring-2 focus:outline-none"
      ]}
      {api.trigger_attrs}
    >
      Open modal
    </button>

    <div class="relative" {api.container_attrs}>
      <div
        class="fixed inset-0 bg-black/40 z-[70]"
        data-transition
        data-enter="ease-in-out duration-200"
        data-enter-from="opacity-0"
        data-enter-to="opacity-100"
        data-leave="ease-in-out duration-200"
        data-leave-from="opacity-100"
        data-leave-to="opacity-0"
        {api.backdrop_attrs}
      >
      </div>

      <div class="fixed inset-0 overflow-y-auto z-[90]">
        <div class="flex min-h-full items-center justify-center p-4 text-center">
          <div
            class="z-[100] w-full max-w-md transform overflow-hidden rounded-md bg-white p-6 text-left align-middle shadow-lg"
            data-transition
            data-enter="ease-in-out duration-300"
            data-enter-from="opacity-0 scale-50"
            data-enter-to="opacity-100 scale-100"
            data-leave="ease-in-out duration-200"
            data-leave-from="opacity-100 scale-100"
            data-leave-to="opacity-0 scale-50"
            data-leave-ended="opacity-0"
            {api.panel_attrs}
          >
            <h3 class="text-lg font-medium leading-6 text-gray-900" {api.title_attrs}>
              Dialog
            </h3>
            <div class="mt-2">
              <p class="text-slate-700" {api.description_attrs}>
                Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.
              </p>
            </div>
            <div class="mt-4">
              <button
                class="inline-flex justify-center rounded-md border border-transparent bg-blue-100 px-4 py-2 text-sm font-medium text-blue-900 hover:bg-blue-200 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                {api.close_button_attrs}
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Overlay.dialog>
  """

  defp dialog_example(assigns) do
    assigns = assign(assigns, source: @dialog_example_code)

    ~H"""
    <.code_example source={@source}>
      <Overlay.dialog :let={api}>
        <button
          class={[
            "block px-3 py-2 text-center text-sm text-slate-700 font-medium rounded-[5px]",
            "bg-white hover:bg-gray-100 focus-visible:ring-2 focus:outline-none"
          ]}
          {api.trigger_attrs}
        >
          Open modal
        </button>

        <div class="relative" {api.container_attrs}>
          <div
            class="fixed inset-0 bg-black/40 z-[70]"
            data-transition
            data-enter="ease-in-out duration-200"
            data-enter-from="opacity-0"
            data-enter-to="opacity-100"
            data-leave="ease-in-out duration-200"
            data-leave-from="opacity-100"
            data-leave-to="opacity-0"
            {api.backdrop_attrs}
          >
          </div>

          <div class="fixed inset-0 overflow-y-auto z-[90]">
            <div class="flex min-h-full items-center justify-center p-4 text-center">
              <div
                class="z-[100] w-full max-w-md transform overflow-hidden rounded-md bg-white p-6 text-left align-middle shadow-lg"
                data-transition
                data-enter="ease-in-out duration-300"
                data-enter-from="opacity-0 scale-50"
                data-enter-to="opacity-100 scale-100"
                data-leave="ease-in-out duration-200"
                data-leave-from="opacity-100 scale-100"
                data-leave-to="opacity-0 scale-50"
                data-leave-ended="opacity-0"
                {api.panel_attrs}
              >
                <h3 class="text-lg font-medium leading-6 text-gray-900" {api.title_attrs}>
                  Dialog
                </h3>
                <div class="mt-2">
                  <p class="text-slate-700" {api.description_attrs}>
                    Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.
                  </p>
                </div>
                <div class="mt-4">
                  <button
                    class="inline-flex justify-center rounded-md border border-transparent bg-blue-100 px-4 py-2 text-sm font-medium text-blue-900 hover:bg-blue-200 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
                    {api.close_button_attrs}
                  >
                    Close
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Overlay.dialog>
    </.code_example>
    """
  end
end
