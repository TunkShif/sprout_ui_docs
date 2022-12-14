const defaultTheme = require("tailwindcss/defaultTheme")
const plugin = require("tailwindcss/plugin")

module.exports = {
  darkMode: "class",
  content: ["./js/**/*.js", "../lib/*_web.ex", "../lib/*_web/**/*.*ex"],
  theme: {
    fontFamily: {
      sans: ["Inter var", ...defaultTheme.fontFamily.sans]
    },
    extend: {
      animation: {
        "slide-down": "slide-down 200ms cubic-bezier(0.87, 0, 0.13, 1)",
        "slide-up": "slide-up 200ms cubic-bezier(0.87, 0, 0.13, 1)"
      },
      keyframes: {
        "slide-down": {
          from: { height: 0 },
          to: { height: "var(--panel-height)" }
        },
        "slide-up": {
          from: { height: "var(--panel-height)" },
          to: { height: 0 }
        }
      },
      typography: {
        DEFAULT: {
          css: {
            "blockquote p:first-of-type::before": {
              content: ""
            },
            "blockquote p:last-of-type::after": {
              content: ""
            },
            code: {
              color: "inherit",
              fontWeight: "500"
            },
            "code::before": {
              content: ""
            },
            "code::after": {
              content: ""
            }
          }
        }
      }
    }
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("sprout-ui/tailwind"),
    plugin(({ addVariant }) =>
      addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])
    ),
    plugin(({ addVariant }) =>
      addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])
    )
  ]
}
