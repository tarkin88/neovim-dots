local lze = require("lze")

lze.load({
  "copilot.lua",
  event = "InsertEnter",
  after = function()
    require("copilot").setup({
      panel = { enabled = false },
      suggestion = {
        enabled = false,
        auto_trigger = false,
      },
      nes = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept_and_goto = "<C-CR>",
          accept = false,
          dismiss = "<Esc>",
        },
      },
      keymap = {
        accept = "<CR>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
        toggle_auto_trigger = false,
      },
      logger = {
        file_log_level = vim.log.levels.OFF,
        print_log_level = vim.log.levels.WARN,
        trace_lsp = "off",
        trace_lsp_progress = false,
        log_lsp_messages = false,
      },
      copilot_node_command = "node",
      server = { type = "nodejs" },
      filetypes = {
        markdown = true,
        python = true,
        lua = true,
        javascript = true,
        typescript = true,
        bash = true,
        ["*"] = false,
      },
    })
  end,
})

lze.load({
  "copilot-lsp",
  event = "InsertEnter",
  after = function()
    require("copilot-lsp").setup({
      nes = {
        move_count_threshold = 3,
      },
    })

    vim.g.copilot_nes_debounce = 500
    vim.lsp.enable("copilot_ls")
  end,
})
