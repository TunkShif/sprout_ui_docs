import "phoenix_html"
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar"
import {
  createSproutConfig,
  Collapsible,
  Accordion,
  Switch,
  Floating,
  Popover,
  Toggle,
  Tooltip,
  Dialog
} from "sprout-ui"

const { initComponents, handleDomChange } = createSproutConfig({
  components: [
    Collapsible(),
    Accordion(),
    Switch(),
    Floating(),
    Popover(),
    Toggle(),
    Tooltip(),
    Dialog()
  ]
})

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  dom: {
    onBeforeElUpdated(from, to) {
      handleDomChange(from, to)
    }
  }
})

topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", () => topbar.delayedShow(200))
window.addEventListener("phx:page-loading-stop", () => topbar.hide())

liveSocket.connect()
window.liveSocket = liveSocket

initComponents()
import("./components")
