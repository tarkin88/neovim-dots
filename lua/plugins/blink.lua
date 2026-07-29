return {
  "saghen/blink.cmp",
  version = "1.*",
  build = "cargo build --release",
  dependencies = {
    {
      "saghen/blink.pairs",
      version = "*",
      build = function() require("blink.pairs").build():pwait(60000) end,
      dependencies = "saghen/blink.download",
      opts = {
        mappings = {
          enabled = true,
          cmdline = true,
          disabled_filetypes = {},
          wrap = {
            -- move closing pair via motion
            ["<C-b>"] = "motion",
            -- move opening pair via motion
            ["<C-S-b>"] = "motion_reverse",
          },
          pairs = {},
        },
        highlights = {
          enabled = true,
          cmdline = true,
          matchparen = {
            enabled = true,
            cmdline = false,
            include_surrounding = false,
            priority = 250,
          },
        },
        debug = false,
      },
    },
    {
      "saghen/blink.indent",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
        static = {
          enabled = false,
        },
        scope = {
          enabled = true,
          underline = {
            enabled = true,
          },
        },
      },
    },
    "rafamadriz/friendly-snippets",
  },
  event = { "InsertEnter" },
  opts = {
    keymap = {
      preset = "super-tab",
      ["<Tab>"] = {
        "snippet_forward",
        function()
          local ok, nes = pcall(require, "copilot-lsp.nes")
          if not ok or not vim.b[vim.api.nvim_get_current_buf()].nes_state then return end
          if nes.walk_cursor_start_edit() then return true end
          if nes.apply_pending_nes() then
            nes.walk_cursor_end_edit()
            return true
          end
        end,
        function()
          local suggestion = require("copilot.suggestion")
          if not suggestion.is_visible() then return end
          suggestion.accept_line()
          return true
        end,
        function(cmp)
          if cmp.snippet_active() then return cmp.accept() end
          return cmp.select_and_accept()
        end,
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
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
      providers = {
        lsp = {
          name = "lsp",
          enabled = true,
          async = true,
          module = "blink.cmp.sources.lsp",
          min_keyword_length = 0,
        },
      },
    },
  },
}
