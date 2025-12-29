return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  init = function()
    vim.keymap.set(
      { "n", "v" },
      "<Leader>lf",
      function() require("conform").format({ async = true, lsp_fallback = true }) end,
      { desc = "[F]ormat buffer" }
    )
    vim.keymap.set("n", "<Leader>hc", ":ConformInfo<CR>", { desc = "[C]onform info" })
  end,
  config = function()
    require("conform").setup({
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      -- format_on_save = {
      --   timeout_ms = 2500,
      --   lsp_format = "fallback",
      -- },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff" },
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
    })
  end,
}
