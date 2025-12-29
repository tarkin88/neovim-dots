return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = false },
      filetypes = {
        gitcommit = true,
        gitrebase = true,
        help = true,
        lua = true,
        markdown = true,
        python = true,
        sh = true,
        toml = true,
        yaml = true,
        zsh = true,
        ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
      },
    })
  end,
}
