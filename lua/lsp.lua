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
  workspace = {
    fileOperations = {
      didRename = true,
      willRename = true,
    },
  },
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
  keys = {},
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

local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
end

local map = vim.keymap.set

map("n", "grf", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Definitions" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Declarations" })
