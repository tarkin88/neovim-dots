return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    picker = {
      enabled = true,
      actions = {
        sidekick_send = function(...)
          return require("sidekick.cli.picker.snacks").send(...)
        end,
      },
      sources = {
        explorer = {
          auto_close = true,
          win = {
            list = {
              keys = {
                ["<C-c>"] = false,
                ["<C-t>"] = "tcd",
              },
            },
          },
        },
      },
      layout = { preset = "vscode" },
      win = {
        input = {
          keys = {
            -- close the picker on ESC instead of going to normal mode,
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<C-p>"] = { "toggle_preview", mode = { "i", "n" } },
            ["<a-a>"] = {
              "sidekick_send",
              mode = { "n", "i" },
            },
          },
        },
      },
    },
    statuscolumn = {
      enabled = false,
      terminal = { enabled = true },
      folds = {
        open = true, -- show open fold icons
      },
    },
    words = { enabled = true },
    scratch = { enabled = false },
    styles = {
      notification = {
        wrap = true,
      },
    },
  },
  keys = {
    -- files
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    -- buffers
    { "<A-Up>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    -- grep
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- git
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    -- lsp
    { "<leader>ld", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    -- words
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    -- explorer
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- scratch
    { "<leader>ss", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>sl", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- undo
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
  },
}
