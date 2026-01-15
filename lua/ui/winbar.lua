local M = {}

M.build = function()
  local filename = vim.fn.expand("%:t")
  if filename == "" then filename = "[No Name]" end

  local modified = vim.bo.modified and " ●" or ""

  return " " .. filename .. modified
end

M.setup = function() vim.o.winbar = "%{%v:lua.require('ui.winbar').build()%}" end

return M
