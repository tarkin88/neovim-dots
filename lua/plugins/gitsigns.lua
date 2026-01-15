local lze = require("lze")

lze.load({
  "gitsigns.nvim",
  event = "BufReadPre",
  after = function()
    require("gitsigns").setup({
      max_file_length = 20000, -- Disable if file is longer than this (in lines)
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
    })
  end,
})
