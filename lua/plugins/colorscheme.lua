return {
  "rose-pine/neovim",
  -- event = "VeryLazy",
  lazy = false,
  priority = 1000,
  name = "rose-pine",
  opts = { variant = "auto" },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine-moon")
  end,
}
