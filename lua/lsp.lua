---------------------------------------------------------------------------
-- Diagnostics
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Capabilities
---------------------------------------------------------------------------

local capabilities = vim.lsp.protocol.make_client_capabilities()

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
})

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my-lsp-features", { clear = false }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then return end

    local bufnr = event.buf

    ---------------------------------------------------------------------------
    -- Inlay hints (Neovim 0.10+)
    ---------------------------------------------------------------------------
    if client:supports_method("textDocument/inlayHint") and vim.lsp.inlay_hint then
      local ih = vim.lsp.inlay_hint

      ih.enable(true, { bufnr = bufnr })

      vim.api.nvim_create_autocmd("InsertEnter", {
        buffer = bufnr,
        callback = function(args)
          local filter = { bufnr = args.buf }
          if ih.is_enabled(filter) then
            ih.enable(false, filter)
            -- reactivar una sola vez al salir de insert
            vim.api.nvim_create_autocmd("InsertLeave", {
              buffer = args.buf,
              once = true,
              callback = function() ih.enable(true, filter) end,
            })
          end
        end,
      })
    end

    ---------------------------------------------------------------------------
    -- CodeLens
    ---------------------------------------------------------------------------
    if client:supports_method("textDocument/codeLens") and vim.lsp.codelens then
      local cl = vim.lsp.codelens

      cl.enable(true)

      vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        buffer = bufnr,
        callback = function() cl.enable(true) end,
      })

      cl.enable(true)
    end
  end,
})

local servers = {
  "basedpyright",
  "bashls",
  "docker_language_server",
  "jsonls",
  "lua_ls",
  "markdown-oxide",
  "postgres_lsp",
  "ruff",
  "taplo",
  "yamlls",
}

vim.lsp.enable(servers)

local map = vim.keymap.set

map("n", "grf", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Definitions" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Declarations" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code lens action" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[r]ename" })
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
map("n", "gq", vim.diagnostic.setqflist, { desc = "Set quickfix list with diagnostics" })

map("n", "gh", function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })

  vim.fn.setreg("+", {}, "V")

  for _, diagnostic in ipairs(diagnostics) do
    vim.fn.setreg("+", vim.fn.getreg("+") .. diagnostic["message"], "V")
  end
end)
