local lze = require("lze")

lze.load({
  {
    "conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo", "Format" },
    after = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff_format" },
          markdown = { "prettier" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          css = { "prettier" },
          less = { "prettier" },
          yaml = { "prettier" },
          sh = { "shfmt" },
          bash = { "shfmt" },
          toml = { "taplo" },
          sql = { "sqlfluff" },
          ["*"] = { "codespell" },
          ["_"] = { "trim_whitespace" },
        },
        formatters = {
          injected = { options = { ignore_errors = true } },
          shfmt = { append_args = { "-i", "2" } },
        },
        format_on_save = {
          timeout_ms = 2500,
          lsp_format = "fallback",
        },
      })
    end,
  },
})
