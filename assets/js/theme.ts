type Theme = "light" | "dark"

export const getTheme = () => (localStorage.getItem("theme") as Theme | null) || "light"
export const setTheme = (theme: Theme) => {
  localStorage.setItem("theme", theme)
  if (theme === "dark") {
    document.documentElement.classList.add("dark")
  } else {
    document.documentElement.classList.remove("dark")
  }
}
