local lze = require("lze")

lze.load({
  "codecompanion.nvim",
  event = "BufReadPre",
  after = function()
    require("mcphub").setup({
      config = vim.fn.expand("~/.config/mcphub/servers.json"),
    })
    require("codecompanion").setup({
      display = {
        separator = "─",
        show_context = true,
        show_token_count = true,
        show_tools_processing = true,
      },
      interactions = {
        chat = {
          adapter = "copilot",
          model = "claude-sonnet-4",
          opts = {
            completion_provider = "blink",
          },
          roles = {
            llm = function(adapter) return "CodeCompanion (" .. adapter.formatted_name .. ")" end,
            user = "Me",
          },
        },
        inline = { adapter = "copilot", model = "claude-sonnet-4" },
      },
      opts = {
        log_level = "DEBUG",
        language = "English",
      },
      extensions = {
        history = {
          enabled = true, -- defaults to true
          opts = {
            picker = "fzf-lua",
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion_chats.json",
          },
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    })
    local map = vim.keymap.set

    map({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Open Chat" })
    map({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "Code Actions" })
  end,
})
