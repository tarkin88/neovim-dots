return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  event = { "InsertEnter" },
  opts = {
    keymap = {
      preset = "super-tab",
      ["<Tab>"] = {
        "snippet_forward",
        function() require("copilot.suggestion").accept_line() end,
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    cmdline = { enabled = false },

    completion = {
      list = {
        selection = { preselect = false, auto_insert = true },
        max_items = 10,
      },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
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
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          name = "lsp",
          enabled = true,
          async = true,
          module = "blink.cmp.sources.lsp",
          min_keyword_length = 0,
        },
      },
      -- per_filetype = {
      --   codecompanion = { "codecompanion" },
      -- },
    },
  },
}
