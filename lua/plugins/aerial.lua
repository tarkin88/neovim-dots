return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle", "AerialOpen", "AerialClose" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.icons",
  },
  opts = {
    layout = {
      min_width = 40,
      max_width = { 60, 0.3 },
    },
  },
  keys = {
    { "<F12>", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" },
  },
}
