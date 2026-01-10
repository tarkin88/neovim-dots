local lze = require("lze")

lze.load({
  {
    "nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    after = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "bash",
          "diff",
          "dockerfile",
          "fish",
          "gitcommit",
          "gitcommit",
          "json",
          "jsonc",
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
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        matchup = { enable = true },
      })

      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
})

lze.load({
  {
    "nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    after = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 3,
        trim_scope = "outer",
      })
    end,
  },
})

lze.load({
  {
    "ts-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    after = function() require("ts-comments").setup({}) end,
  },
})
