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
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
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
        default = {
          "lsp",
          "copilot",
          "buffer",
          "path",
          "snippets",
        },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            async = true,
            module = "blink.cmp.sources.lsp",
            min_keyword_length = 0,
          },
          copilot = {
            enabled = true,
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            min_keyword_length = 2,
            opts = {
              kind_hl = "BlinkCmpKindCopilot",
              max_completions = 3,
              max_attempts = 4,
              kind = "Copilot",
              debounce = 750,
            },
          },
        },
      },
      signature = { enabled = true },
      fuzzy = {
        implementation = "prefer_rust",
      },
    })
    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuOpen",
      callback = function() vim.b.copilot_suggestion_hidden = true end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkCmpMenuClose",
      callback = function() vim.b.copilot_suggestion_hidden = false end,
    })
  end,
})
