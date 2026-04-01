return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    max_file_length = 9000,
    numhl = true,
    signs = {
      add = {
        text = "▍",
      },
      change = {
        text = "▍",
      },
      delete = {
        text = "▸",
      },
      topdelete = {
        text = "▾",
      },
      changedelete = {
        text = "▍",
      },
    },
  },
  keys = {
    { "<leader>hb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame Line" },
    { "<leader>hd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff this" },
    { "<leader>hp", "<cmd>Gitsigns preview_hunk_inline<CR>", desc = "Preview line" },
  },
}
