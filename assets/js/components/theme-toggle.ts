import { LiveElement } from "@tunkshif/live-element"
import { query, attr } from "@tunkshif/live-element/decorators"
import { getTheme, setTheme } from "../theme"

export default class ThemeToggleElement extends LiveElement {
  @query("trigger", { part: true })
  trigger: HTMLElement

  @attr("data-theme", { live: true })
  theme: "light" | "dark"

  constructor() {
    super()
    this.handleClick = this.handleClick.bind(this)
  }

  connectedCallback() {
    if (!this.trigger) throw new Error("ThemeToggle must have a trigger element.")
    this.theme = getTheme()
    this.trigger.addEventListener("click", this.handleClick)
  }

  disconnectedCallback() {
    this.trigger.removeEventListener("click", this.handleClick)
  }

  handleClick() {
    const target = this.theme === "light" ? "dark" : "light"
    this.theme = target
    setTheme(target)
  }
}
