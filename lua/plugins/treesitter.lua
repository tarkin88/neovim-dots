return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },

  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        -- Avoid the sticky context from growing a lot.
        max_lines = 3,
        -- Match the context lines to the source code.
        multiline_threshold = 1,
        -- Disable it when the window is too small.
        min_window_height = 20,
      },
    },
     "folke/ts-comments.nvim",
    "andymass/vim-matchup",
  },
  build = ":TSUpdate",
  opts_extend = { "ensure_installed" },
  opts = {
    indent = { enable = true }, ---@type lazyvim.TSFeat
    highlight = { enable = true }, ---@type lazyvim.TSFeat
    folds = { enable = true }, ---@type lazyvim.TSFeat
    ensure_installed = {
      "bash",
      "diff",
      "json",
      "dockerfile",
      "fish",
      "gitcommit",
      "gitcommit",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "toml",
      "yaml",
      "tsx",
      "typescript",
    },
  },
  config = function(_, opts)
    local TS = require("nvim-treesitter")
    setmetatable(require("nvim-treesitter.install"), {
      __newindex = function(_, k)
        if k == "compilers" then
          vim.schedule(
            function()
              LazyVim.error({
                "Setting custom compilers for `nvim-treesitter` is no longer supported.",
                "",
                "For more info, see:",
                "- [compilers](https://docs.rs/cc/latest/cc/#compile-time-requirements)",
              })
            end
          )
        end
      end,
    })
  end,
}
