return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        truncate_names = true,
        show_close_icon = false,
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp",
        numbers = "ordinal",
        show_buffer_icons = true,
        separator_style = "thin",
      },
    },
    keys = {
      -- Buffer navigation.
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick a buffer to open" },
      { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Select a buffer to close" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    },
  },
}
