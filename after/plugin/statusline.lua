local api = vim.api
local fn = vim.fn
local diagnostic = vim.diagnostic
local severity = diagnostic.severity

local function hl(name) return api.nvim_get_hl(0, { name = name, link = false }) end

local function derive_hl(new_name, base, opts)
  local base_def = hl(base) or {}
  local def = vim.tbl_extend("force", base_def, opts or {})
  api.nvim_set_hl(0, new_name, def)
end

local function setup_statusline_highlights()
  derive_hl("statusline_branch", "StatusLine", { bold = true })
  derive_hl("statusline_misc", "StatusLineNC", { italic = true })

  api.nvim_set_hl(0, "statusline_debugger_session", { link = "Debug" })
  api.nvim_set_hl(0, "statusline_separator", { link = "StatusLine" })
  api.nvim_set_hl(0, "StatuslineGitAdd", { link = "GitSignsAdd" })
  api.nvim_set_hl(0, "StatuslineGitChange", { link = "GitSignsChange" })
  api.nvim_set_hl(0, "StatuslineGitDelete", { link = "GitSignsDelete" })
end
local function git_branch()
  local branch = vim.b.gitsigns_head
  if branch == nil then return "%#statusline_branch# -- " end

  local status = vim.b.gitsigns_status_dict or {}
  local added = status.added or 0
  local changed = status.changed or 0
  local removed = status.removed or 0

  return table.concat({
    "%#statusline_branch# [ ",
    branch,
    " ]",
    "%#StatuslineGitAdd#  +",
    added,
    "%#StatuslineGitDelete#  -",
    removed,
    "%#StatuslineGitChange#  ~",
    changed,
    "%#statusline_branch# ",
  })
end

local function current_mode()
  local mode = fn.mode()
  local mode_aliases = {
    n = "n",
    i = "i",
    v = "v",
    V = "v",
    t = "t",
    c = "c",
    s = "s",
    ["␖"] = "v",
  }

  mode = mode and mode_aliases[mode] and mode_aliases[mode]:upper() or "?"
  return "%#statusline_mode# " .. mode .. " "
end
local function diagnostics()
  local counts = diagnostic.count(0) or {}
  local num_warning = counts[severity.WARN] or 0
  local num_error = counts[severity.ERROR] or 0
  local num_hint = counts[severity.HINT] or 0

  return table.concat({
    "%#DiagnosticError#   ",
    num_error,
    "%#DiagnosticWarn#   ",
    num_warning,
    "%#DiagnosticHint#   ",
    num_hint,
    "%#statusline_separator# ",
  })
end

local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if next(clients) == nil then return "%#statusline_misc# [No LSP] " end

  local lsp_name = clients[1].name

  if vim.b.lsp_loading then return "%#DiagnosticHint#  [ ↻ Loading LSP ] " end

  return "%#statusline_misc# [" .. lsp_name .. "] "
end

local function debugger_session()
  local ok, dap = pcall(require, "dap")
  if not ok then return "" end

  local active_session = dap.session()
  if active_session == nil then return "" end

  return "%#statusline_debugger_session# " .. active_session.config.name .. " "
end

local function search_position()
  local ok, result = pcall(fn.searchcount, { maxcount = 999, timeout = 200 })
  if not ok or result.total == 0 then return "" end

  return "%#statusline_misc# " .. fn.getreg("/") .. " [" .. result.current .. "/" .. result.total .. "] "
end

local function separator() return "%#statusline_separator#%=" end

local function miscellaneous()
  local reg = fn.reg_recording()
  if reg == "" then return search_position() end
  return "%#statusline_misc# recording @" .. reg .. " "
end

function Status_line()
  return table.concat({
    current_mode(),
    diagnostics(),
    separator(),
    git_branch(),
    separator(),
    lsp_status(),
    debugger_session(),
  })
end

setup_statusline_highlights()

api.nvim_create_autocmd("ColorScheme", {
  group = api.nvim_create_augroup("StatuslineHighlights", { clear = true }),
  callback = setup_statusline_highlights,
})

-- vim.opt.laststatus = 2
vim.o.statusline = "%!v:lua.Status_line()"

api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = api.nvim_create_augroup("StatuslineCursorline", { clear = true }),
  callback = function() vim.opt_local.cursorline = true end,
})

api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  group = api.nvim_create_augroup("StatuslineCursorline", { clear = false }),
  callback = function() vim.opt_local.cursorline = false end,
})
