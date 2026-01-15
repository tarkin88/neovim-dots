local M = {}

local function get_buf_name(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  if name == "" then return "[No Name]" end
  return vim.fn.fnamemodify(name, ":t")
end

M.render = function()
  local current = vim.api.nvim_get_current_buf()
  local parts = {}

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(buf) == 1 then
      local name = get_buf_name(buf)
      local modified = vim.bo[buf].modified and " ●" or ""
      local hl

      if buf == current then
        hl = "%#TabLineSel#"
        table.insert(parts, hl .. "  " .. name .. modified .. "  ")
      else
        hl = "%#TabLine#"
        table.insert(parts, hl .. " " .. name .. modified .. " ")
      end
    end
  end

  table.insert(parts, "%#TabLineFill#")

  return table.concat(parts, "")
end

M.setup = function()
  vim.o.showtabline = 2
  vim.o.tabline = "%!v:lua.require('ui.tabline').render()"
end

return M
