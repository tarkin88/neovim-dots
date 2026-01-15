local lze = require("lze")

lze.load({
  {
    "mini.move",
    event = { "BufReadPost" },
    after = function() require("mini.move").setup() end,
  },
  {
    "mini.pairs",
    event = { "BufReadPost" },
    after = function() require("mini.pairs").setup() end,
  },
  {
    "mini.indentscope",
    event = { "BufReadPost" },
    after = function()
      require("mini.indentscope").setup({
        symbol = "▎",
      })
    end,
  },
  {
    "mini.notify",
    event = { "BufReadPost" },
    after = function()
      local MiniNotify = require("mini.notify")

      MiniNotify.setup({
        lsp_progress = { enable = true },
        content = {
          format = function(notif)
            local msg = notif.message or notif.msg or "[no message]"
            return vim.trim(msg):gsub("\n", " ")
          end,
        },
        window = {
          config = {
            anchor = "SE",
            col = vim.o.columns - 3,
            row = vim.o.lines - 3,
            border = "single",
          },
          max_width_share = 0.35,
        },
      })

      vim.notify = MiniNotify.make_notify({ ERROR = { duration = 10000 } })
    end,
  },
  {
    "mini.hipatterns",
    event = { "BufReadPost" },
    after = function()
      local mini_hipatterns = require("mini.hipatterns")

      mini_hipatterns.setup({
        highlighters = {
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          hex_color = mini_hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
  {
    "mini.clue",
    -- event = { "BufReadPost" },
    after = function()
      local miniclue = require("mini.clue")

      miniclue.setup({
        window = {
          config = function(bufnr)
            local max_width = 0
            for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
              max_width = math.max(max_width, vim.fn.strchars(line))
            end

            -- Keep some right padding.
            max_width = max_width + 5

            return {
              -- Dynamic width capped at 100.
              width = math.min(100, max_width),
            }
          end,

          delay = 300,
        },
        triggers = {
          -- Leader triggers
          { mode = { "n", "x" }, keys = "<Leader>" },

          -- `[` and `]` keys
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = { "n", "x" }, keys = "g" },

          -- Marks
          { mode = { "n", "x" }, keys = "'" },
          { mode = { "n", "x" }, keys = "`" },

          -- Registers
          { mode = { "n", "x" }, keys = '"' },
          { mode = { "i", "c" }, keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = { "n", "x" }, keys = "z" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.square_brackets(),
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
    end,
  },
})
