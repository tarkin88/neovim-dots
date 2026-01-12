local lze = require("lze")

lze.load({
  "blink.cmp",
  event = { "InsertEnter" },
  after = function()
    local blink = require("blink.cmp")

    blink.setup({
      keymap = {
        preset = "default",
        ["<CR>"] = { "select_and_accept", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      cmdline = { enabled = false },

      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
          max_items = 10,
        },
        documentation = { auto_show = true },
        ghost_text = {
          enabled = true,
        },
        menu = {
          scrollbar = false,
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
          },
        },
      },
      sources = {
        default = {
          "lsp",
          "copilot",
          "snippets",
          "path",
          "buffer",
        },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = -10,
            async = true,
            opts = {
              kind_hl = "BlinkCmpKindCopilot",
            },
          },
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
  end,
})
