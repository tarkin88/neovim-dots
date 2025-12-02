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
        lua = true,
        python = true,
        zsh = true,
        toml = true,
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = true,
        gitrebase = true,
        sh = true,
        ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
      },
    })
  end,
}
