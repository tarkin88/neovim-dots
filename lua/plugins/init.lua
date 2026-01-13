vim.pack.add({
  "https://github.com/BirdeeHub/lze",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/folke/ts-comments.nvim",
  "https://github.com/b0o/SchemaStore.nvim",
  "https://github.com/fang2hou/blink-copilot",
  "https://github.com/github/copilot.vim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/andymass/vim-matchup",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-mini/mini.move",
  "https://github.com/nvim-mini/mini.pairs",
  "https://github.com/nvim-mini/mini.clue",
  "https://github.com/nvim-mini/mini.diff",
  "https://github.com/nvim-mini/mini.hipatterns",
  "https://github.com/nvim-mini/mini.indentscope",
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.8.0" },
}, {
  load = function(p) vim.cmd("packadd " .. p.spec.name) end,
  confirm = false,
})

-- specs
require("plugins.treesitter")
require("plugins.mason")
require("plugins.schemastore")
require("plugins.conform")
require("plugins.copilot")
require("plugins.blink")
require("plugins.fzf")
require("plugins.mini")
