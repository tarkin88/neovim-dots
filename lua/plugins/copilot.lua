return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
  },
  opts = {
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
  },
}
