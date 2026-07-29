return {
  "ravitemer/mcphub.nvim",
  build = "npm install -g mcp-hub@latest",
  cmd = { "MCPHub" },
  -- build = "bundled_build.lua",
  dependencies = { "olimorris/codecompanion.nvim", "nvim-lua/plenary.nvim" },
  opts = {
    use_bundled_binary = false,
    level = vim.log.levels.DEBUG,
    to_file = true,
  },
}
