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
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
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
        ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
      },
      formatters = {
        shfmt = { append_args = { "-i", "2" } },
      },
    })
  end,
}
