return {
  enabled = false,
  "stevearc/oil.nvim",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  cmd = { "Oil" },
  opts = {
    float = {
      padding = 5,
      max_width = 80,
      max_height = 20,
    },
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { "<leader>e", function() require("oil").toggle_float() end, desc = "Open Oil" },
  },
}
