return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
  event = "BufReadPost",
  cmd = { "TodoFzfLua" },
  opts = {},
  keys = {
    { "<leader>ft", "<cmd>TodoFzfLua<CR>", desc = "Search [t]odos" },
  },
}
