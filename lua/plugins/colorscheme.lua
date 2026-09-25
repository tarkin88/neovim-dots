return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = { dim_inactive_windows = false },
  config = function(_, opts)
    require("rose-pine").setup(opts)

    vim.cmd.colorscheme("rose-pine-dawn")
  end,
}
