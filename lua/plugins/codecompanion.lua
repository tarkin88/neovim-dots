return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  cmd = {
    "CodeCompanion",
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
    "CodeCompanionCLI",
  },
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  opts = {
    display = {
      chat = {
        show_settings = true,
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = false,
          make_slash_commands = true,
          show_result_in_chat = true,
          make_slash_commands = true,
        },
      },
    },
    interactions = {
      chat = {
        adapter = "claude_code",
        model = "claude-sonnet",
      },
      inline = {
        adapter = "claude_code",
        model = "claude-sonnet",
      },
      cli = {
        agent = "claude_code",
      },
    },
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              CLAUDE_CODE_OAUTH_TOKEN = vim.env.CLAUDE_CODE_OAUTH_TOKEN,
            },
            defaults = {
              mcpServers = "inherit_from_config",
            },
          })
        end,
      },
    },
    prompt_library = {
      markdown = {
        dirs = {
          vim.fn.getcwd() .. "/prompts", -- Can be relative
        },
      },
    },
    rules = {
      default = {
        description = "Collection of common files for all projects",
        files = {
          ".clinerules",
          ".cursorrules",
          ".goosehints",
          ".rules",
          ".windsurfrules",
          ".github/copilot-instructions.md",
          "AGENT.md",
          "AGENTS.md",
          { path = "CLAUDE.md", parser = "claude" },
          { path = "CLAUDE.local.md", parser = "claude" },
          { path = "~/.claude/CLAUDE.md", parser = "claude" },
        },
        is_preset = true,
      },
      opts = {
        chat = {
          autoload = "default", -- The rule groups to load
          enabled = true,
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
