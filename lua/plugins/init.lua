vim.pack.add({
  "https://github.com/BirdeeHub/lze",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/folke/ts-comments.nvim",
  "https://github.com/b0o/SchemaStore.nvim",
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/copilotlsp-nvim/copilot-lsp",
  "https://github.com/fang2hou/blink-copilot",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/ravitemer/codecompanion-history.nvim",
  "https://github.com/ravitemer/mcphub.nvim",
  "https://github.com/olimorris/codecompanion.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/andymass/vim-matchup",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-mini/mini.move",
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-mini/mini.pairs",
  "https://github.com/nvim-mini/mini.clue",
  "https://github.com/nvim-mini/mini.notify",
  "https://github.com/nvim-mini/mini.hipatterns",
  "https://github.com/nvim-mini/mini.indentscope",
  { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("^1") },
}, {
  load = function(p) vim.cmd("packadd " .. p.spec.name) end,
  confirm = false,
})

-- specs
require("plugins.treesitter")
require("plugins.mason")
require("plugins.gitsigns")
require("plugins.conform")
require("plugins.copilot")
require("plugins.codecompanion")
require("plugins.blink")
require("plugins.mini")
require("plugins.fzf")
