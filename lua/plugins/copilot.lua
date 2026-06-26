return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = false, -- handled by completion engine
        dismiss = "<Esc>",
      },
    },
    filetypes = {
      markdown = false,
      ["*"] = true,
    },
  },
}
