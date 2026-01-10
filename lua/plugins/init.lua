vim.pack.add({
  "https://github.com/BirdeeHub/lze",
  "https://github.com/b0o/SchemaStore.nvim",
  "https://github.com/fang2hou/blink-copilot",
  "https://github.com/github/copilot.vim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/folke/ts-comments.nvim",
  "https://github.com/andymass/vim-matchup",
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.8.0" },
}, {
  load = function(p) vim.cmd("packadd " .. p.spec.name) end,
  confirm = false,
})

-- specs
require("plugins.mason")
require("plugins.schemastore")
require("plugins.conform")
require("plugins.copilot")
require("plugins.blink")
require("plugins.treesitter")
