return {
  "catppuccin/nvim",
  name = "catppuccin",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = { "bold" },
      keywords = { "italic" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = { "underline" },
      operators = { "italic" },
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = false,
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin-frappe")
  end,
}
