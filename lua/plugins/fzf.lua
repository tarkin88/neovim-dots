local lze = require("lze")

lze.load({
  "fzf-lua",
  keys = {
    { "<leader><leader>", "<cmd>FzfLua files<CR>", desc = "Smart" },
    { "<C-p>", "<cmd>FzfLua global<CR>", desc = "VSLike" },
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Recent Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help Tags" },
    { "<leader>ld", "<cmd>FzfLua diagnostics_document<CR>", desc = "diagnostics" },
    { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "lsp symbols" },
  },
  after = function()
    require("fzf-lua").setup({
      winopts = {
        height = 0.45,
        width = 0.40,
        preview = {
          border = "rounded",
          layout = "flex",
          hidden = true,
        },
      },
      files = {
        cmd = "fd --type f --hidden --strip-cwd-prefix --exclude .git",
        git_icons = true,
        file_icons = true,
      },
      grep = {
        rg_opts = "--hidden --glob '!.git' --column --line-number --no-heading --color=always --smart-case",
      },
      lsp = {
        symbols = {
          symbol_style = 1,
        },
      },
    })
  end,
})
