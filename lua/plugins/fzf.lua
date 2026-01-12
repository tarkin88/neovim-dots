local lze = require("lze")

lze.load({
  "fzf-lua",
  keys = {
    { "<leader><leader>", "<cmd>FzfLua combine pickers=oldfiles;git_files<CR>", desc = "Smart" },
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Recent Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "Help Tags" },
  },
  after = function()
    require("fzf-lua").setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = {
          layout = "flex",
        },
      },
      files = {
        git_icons = true,
        file_icons = true,
      },
      grep = {
        rg_opts = "--hidden --glob '!.git' --column --line-number --no-heading --color=always --smart-case",
      },
    })
  end,
})
