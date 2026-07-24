return {
  "loctvl842/monokai-pro.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 1000,
  config = function()
    require("monokai-pro").setup({
      filter = "octagon",
      devicons = true,
      override = function(scheme)
        return {
          LspInlayHint = { fg = scheme.base.dimmed1, bg = "NONE", bold = true, italic = true },
          LspCodeLens = { fg = scheme.base.cyan, bg = "NONE", bold = true },
          ContextVt = { fg = scheme.base.dimmed4, bg = "NONE", italic = true },
        }
      end,
    })

    vim.cmd.colorscheme("monokai-pro-octagon")
  end,
}
