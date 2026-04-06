return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "folke/ts-comments.nvim",
    "andersevenrud/nvim_context_vt",
  },
  lazy = false,
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.config").setup(opts)

    require("treesitter-context").setup({
      enable = true,
      max_lines = 3,
      trim_scope = "outer",
    })

    require("nvim-treesitter").install({
      "bash",
      "diff",
      "dockerfile",
      "fish",
      "gitcommit",
      "json",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "sql",
      "toml",
      "tsx",
      "typescript",
      "yaml",
    })
  end,
}
