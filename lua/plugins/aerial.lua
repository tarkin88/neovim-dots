return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    layout = {
      min_width = 40,
      max_width = { 60, 0.3 },
    },
    autojump = true,
    close_on_select = true,
  },
  keys = {
    { "<F12>", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" },
  },
}
