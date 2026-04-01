return {
  "olimorris/codecompanion.nvim",
  event = "User AstroFile",
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
    "CodeCompanionCLI",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
  },
  opts = {
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
    interactions = {
      chat = {
        adapter = "copilot",
        model = "claude-sonnet",
        variables = {},
      },
      inline = {
        adapter = "copilot",
        model = "claude-sonnet",
      },
      cli = {
        agent = "claude_code",
        agents = {
          claude_code = {
            cmd = "claude",
            args = {},
            description = "Claude Code CLI",
            provider = "terminal",
          },
        },
      },
    },
  },
  keys = {
    { "<leader>c", "", desc = "Code [c]ompanion" },
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "[c]hat" },
    { "<leader>cl", "<cmd>CodeCompanionCLI<cr>", desc = "c[l]i" },
    {
      "<leader>cx",
      function() require("codecompanion").cli("#{this}", { focus = true }) end,
      desc = "add context to cli",
      mode = "v",
    },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "[a]ctions" },
    { "<leader>cd", "<cmd>CodeCompanionChat Add<cr>", desc = "a[d]d visual selection", mode = "v" },
  },
}
