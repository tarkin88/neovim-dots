return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
    "folke/sidekick.nvim",
  },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Tab>"] = {
        "snippet_forward",
        function() -- sidekick next edit suggestion
          return require("sidekick").nes_jump_or_apply()
        end,
        "fallback",
      },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    cmdline = { enabled = false },

    completion = {
      list = {
        -- Insert items while navigating the completion list.
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
        "path",
        "snippets",
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
  },
  opts_extend = { "sources.default" },
}
