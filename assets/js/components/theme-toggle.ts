import { LiveMixin } from "@tunkshif/live-element"
import { getTheme, setTheme } from "../theme"

export default class ThemeToggleElement extends LiveMixin(HTMLButtonElement) {
  private theme: "light" | "dark"

  constructor() {
    super()
    this.handleClick = this.handleClick.bind(this)
  }

  connectedCallback() {
    this.theme = getTheme()
    this.addEventListener("click", this.handleClick)
  }

  disconnectedCallback() {
    this.removeEventListener("click", this.handleClick)
  }

  handleClick() {
    const target = this.theme === "light" ? "dark" : "light"
    this.theme = target
    setTheme(target)
  }
}

customElements.define("theme-toggle", ThemeToggleElement, { extends: "button" })
