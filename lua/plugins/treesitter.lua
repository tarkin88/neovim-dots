return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = {
    "TSBufDisable",
    "TSBufEnable",
    "TSBufToggle",
    "TSDisable",
    "TSEnable",
    "TSToggle",
    "TSInstall",
    "TSInstallInfo",
    "TSInstallSync",
    "TSModuleInfo",
    "TSUninstall",
    "TSUpdate",
    "TSUpdateSync",
  },
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
    "andymass/vim-matchup",
  },
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = {
        "bash",
        "diff",
        "dockerfile",
        "fish",
        "gitcommit",
        "gitcommit",
        "graphql",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "rasi",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "yaml",
      },
      ignore_install = {},
      highlight = {
        enable = true,
        disable = { "markdown" },
      },
      indent = { enable = true, disable = { "yaml" } },
      fold = { enable = true },
    })

    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
  end,
}
