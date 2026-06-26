return {
  enable = false,
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "BufReadPre",
  priority = 1000,
  opts = {
    preset = "classic",
    transparent_bg = true,
    options = {
      add_messages = {
        display_count = true,
      },
      multilines = {
        enabled = true,
      },
      show_source = {
        enabled = true,
      },
    },
  },
}
