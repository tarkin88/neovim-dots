vim.diagnostic.config({
  underline = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
    current_line = true,
    severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.ERROR },
  },
  virtual_lines = false,
  severity_sort = true,
  update_in_insert = false,
  signs = {
    priority = 9999,
    severity = { min = vim.diagnostic.severity.WARN, max = vim.diagnostic.severity.ERROR },
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "None",
      [vim.diagnostic.severity.HINT] = "None",
      [vim.diagnostic.severity.INFO] = "None",
    },
  },

  float = {
    title = " Diagnostic ",
    header = "",
    border = "single",
    scope = "line",
  },
})

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
vim.keymap.set("n", "gq", vim.diagnostic.setqflist, { desc = "Set quickfix list with diagnostics" })

vim.keymap.set("n", "gK", function()
  if not vim.diagnostic.config().virtual_lines then
    vim.diagnostic.config({ virtual_lines = { current_line = true } })
  else
    vim.diagnostic.config({ virtual_lines = false })
  end
end, { desc = "Toggle diagnostic current line virtual_lines" })

vim.keymap.set("n", "gh", function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })

  vim.fn.setreg("+", {}, "V")

  for _, diagnostic in ipairs(diagnostics) do
    vim.fn.setreg("+", vim.fn.getreg("+") .. diagnostic["message"], "V")
  end
end)
