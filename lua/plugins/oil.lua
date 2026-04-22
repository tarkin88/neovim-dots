return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  cmd = { "Oil" },
  opts = {
    float = {
      padding = 5,
      max_width = 0.4,
      max_height = 0.7,
    },
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { "<leader>e", function() require("oil").open_float() end, desc = "Open Oil" },
  },
}
