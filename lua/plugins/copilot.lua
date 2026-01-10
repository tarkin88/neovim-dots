local lze = require("lze")

lze.load({
  {
    "copilot.vim",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    after = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true

      vim.g.copilot_filetypes = {
        gitcommit = true,
        gitrebase = true,
        help = true,
        lua = true,
        markdown = true,
        python = true,
        sh = true,
        toml = true,
        yaml = true,
        ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
      }

      -- vim.keymap.set("i", "<Tab>", 'copilot#Accept("<CR>")', {
      --   silent = true,
      --   expr = true,
      --   noremap = true,
      --   replace_keycodes = false,
      --   desc = "Copilot Accept",
      -- })

      vim.keymap.set("i", "<C-CR>", 'copilot#Accept("<CR>")', {
        silent = true,
        expr = true,
        noremap = true,
        replace_keycodes = false,
        desc = "Copilot Accept",
      })
    end,
  },
})
