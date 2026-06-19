local M = {}

local function get_native_icon()
  local ft = vim.bo.filetype
  local icons = {
    python = " ",
    javascript = "󰌞 ",
    typescript = " ",
    html = " ",
    css = " ",
    json = " ",
    markdown = " ",
    sh = " ",
    lua = " ",
    rust = " ",
    go = " ",
    c = " ",
    cpp = " ",
    csv = " ",
  }
  return icons[ft] or " "
end

function Winbar()
  if vim.bo.buftype ~= "" or vim.bo.filetype == "" then return "" end

  local path = vim.fn.expand("%:.:h")
  local filename = vim.fn.expand("%:t")

  local winbar_str = "%#WinbarBreadcrumb# "

  if path ~= "." and path ~= "" then
    local formatted_path = path:gsub("/", " › ")
    winbar_str = winbar_str .. formatted_path .. " › "
  end

  local icon = get_native_icon()
  winbar_str = winbar_str .. "%#WinbarFileIcon#" .. icon .. "%#WinbarFilename#" .. filename

  return winbar_str
end

vim.api.nvim_set_hl(0, "WinbarBreadcrumb", { fg = "#808080", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "WinbarFileIcon", { link = "Title" })
vim.api.nvim_set_hl(0, "WinbarFilename", { fg = "#EEEEEE", bg = "NONE", bold = true })

vim.opt.winbar = "%!v:lua.Winbar()"

return M
