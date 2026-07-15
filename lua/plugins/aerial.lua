return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    backends = { "treesitter", "lsp", "markdown" },
    layout = {
      min_width = 40,
      max_width = { 60, 0.3 },
    },
    autojump = true,
    close_on_select = true,
    show_guides = true,
  },
  keys = {
    { "<F12>", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" },
  },
}
