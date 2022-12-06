defmodule SproutDocsWeb.DocsHtml.GettingStarted do
  use SproutDocsWeb, :html
  use MDEEx

  alias SproutUI.Overlay

  embed_markdowns("getting_started/*")

  defp tooltip_example(assigns) do
    ~H"""
    <div class="not-prose relative grid place-items-center rounded-md h-[220px] bg-[linear-gradient(120deg,#a1c4fd_0%,#c2e9fb_100%)]">
      <Overlay.popover :let={api} offset={12} placement="top">
        <button
          class="px-4 py-2 bg-white hover:bg-gray-100 text-sm text-gray-800 font-medium rounded-md outline-none focus:outline-2 focus:outline-offset-2 focus:outline-white"
          {api.trigger_attrs}
        >
          Toggle
        </button>
        <div
          class="absolute z-10 max-w-xs bg-white rounded-md shadow-md"
          data-transition
          data-enter="transition duration-200 ease-in-out"
          data-enter-from="opacity-0"
          data-enter-to="opacity-100"
          data-leave="transition duration-300 ease-in-out"
          data-leave-from="opacity-100"
          data-leave-to="opacity-0"
          {api.panel_attrs}
        >
          <div class="px-6 py-4">
            <h3 class="text-lg font-medium leading-6 text-gray-900">Prose</h3>

            <div class="mt-2">
              <p class="text-sm text-gray-500">
                Lorem ipsum dolor sit amet, qui minim labore adipisicing minim
                sint cillum sint consectetur cupidatat.
              </p>
            </div>
          </div>
        </div>
      </Overlay.popover>
    </div>
    """
  end
end
