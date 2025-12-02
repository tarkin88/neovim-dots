local capabilities = vim.lsp.protocol.make_client_capabilities()
local diagnostic_opts = {
  signs = {
    priority = 9999,
    severity = { min = "WARN", max = "ERROR" },
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
  },
  virtual_lines = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
    current_line = true,
    severity = { min = "INFO", max = "ERROR" },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    header = "",
  },
}

vim.diagnostic.config(diagnostic_opts)

capabilities = vim.tbl_deep_extend("force", capabilities, {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
})
vim.lsp.config("*", {
  capabilities = capabilities,
})

local servers = {
  "lua_ls",
  "bashls",
  "yamlls",
  "jsonls",
  "taplo",
  "basedpyright",
  "ruff",
  "docker_language_server",
}

vim.lsp.enable(servers)
