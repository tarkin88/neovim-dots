return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo", "Format" },
  opts = {
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
    change_detection = {
      enabled = false,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  },
}
