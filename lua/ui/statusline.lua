local M = {}

local cached_branch = {}
local cached_buffers = {}

local function get_git_branch()
  local bufnr = vim.fn.bufnr("%")
  if cached_buffers[bufnr] and cached_branch[bufnr] then return cached_branch[bufnr] end

  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  if not handle then return nil end
  local branch = handle:read("*a"):gsub("\n", "")
  handle:close()

  branch = branch ~= "" and branch or nil
  cached_buffers[bufnr] = true
  cached_branch[bufnr] = branch
  return branch
end

M.active = function()
  local mode = vim.fn.mode()
  local current_mode = mode:upper()

  local filename = vim.fn.expand("%:t")
  if filename == "" then filename = "[No Name]" end

  local modified = vim.bo.modified and "●" or ""
  local readonly = vim.bo.readonly and "RO" or ""

  local branch = get_git_branch()
  local branch_str = branch and " " .. "[ " .. branch .. " ]" or ""

  local diagnostics = ""
  local counts = vim.diagnostic.count(0) or {}

  if (counts[vim.diagnostic.severity.ERROR] or 0) > 0 then
    diagnostics = diagnostics .. "✘ " .. counts[vim.diagnostic.severity.ERROR] .. " "
  end
  if (counts[vim.diagnostic.severity.WARN] or 0) > 0 then
    diagnostics = diagnostics .. "⚠ " .. counts[vim.diagnostic.severity.WARN] .. " "
  end

  local left = " " .. current_mode .. " "
  local center_content = filename
    .. (modified ~= "" and " " .. modified or "")
    .. (readonly ~= "" and " " .. readonly or "")
    .. branch_str

  local right = (diagnostics ~= "" and "  " .. diagnostics or "") .. " L: %l C:%c  %P "

  return "%#LineLeft#" .. left .. "%#LineCenter#%=" .. center_content .. "%=" .. "%#LineRight#" .. right
end

M.inactive = function()
  local filename = vim.fn.expand("%:t")
  if filename == "" then filename = "[No Name]" end
  return " " .. filename
end

M.setup = function()
  vim.o.statusline = "%!v:lua.require('ui.statusline').active()"
  vim.o.laststatus = 2

  local function setup_highlights()
    vim.api.nvim_set_hl(0, "LineLeft", { link = "DiffText" })
    vim.api.nvim_set_hl(1, "LineCenter", { link = "SpecialKey" })
    vim.api.nvim_set_hl(0, "LineRight", { link = "Conceal" })
  end

  setup_highlights()

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("LineColorScheme", { clear = true }),
    callback = setup_highlights,
  })

  vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
    group = vim.api.nvim_create_augroup("LineBranchCache", { clear = true }),
    callback = function()
      local bufnr = vim.fn.bufnr("%")
      cached_branch[bufnr] = nil
    end,
  })

  vim.api.nvim_create_autocmd({ "DiagnosticChanged", "LspProgress", "BufModifiedSet" }, {
    group = vim.api.nvim_create_augroup("LineUpdate", { clear = true }),
    callback = vim.schedule_wrap(function() vim.cmd("redrawstatus") end),
  })
end

return M
