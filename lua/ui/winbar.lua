local M = {}

-- Selector nativo de iconos genéricos según el tipo de archivo (Sin plugins)
local function get_native_icon()
  local ft = vim.bo.filetype
  local icons = {
    lua = "   ",
    python = " ",
    javascript = " ",
    typescript = " ",
    html = " ",
    css = " ",
    json = " ",
    markdown = " ",
    sh = " ",
    zsh = " ",
    rust = " ",
    go = " ",
    c = " ",
    cpp = " ",
  }
  -- Si el filetype tiene un icono asignado lo usa, si no, usa un icono de archivo genérico
  return icons[ft] or "📄 "
end

M.get_winbar = function()
  -- Desactivar winbar en ventanas especiales (ej: terminales, exploradores)
  if vim.bo.buftype ~= "" or vim.bo.filetype == "" then return "" end

  -- 1. Obtener la ruta relativa al proyecto (ej: src/components/NavBar)
  local path = vim.fn.expand("%:.:h")
  local filename = vim.fn.expand("%:t")

  -- Color base gris tenue estilo IntelliJ para las migas de pan (breadcrumbs)
  local winbar_str = "%#WinbarBreadcrumb# "

  -- 2. Si el archivo está dentro de carpetas, formateamos la ruta
  if path ~= "." and path ~= "" then
    -- Reemplazamos las barras diagonals '/' por flechas ' › '
    local formatted_path = path:gsub("/", " › ")
    winbar_str = winbar_str .. formatted_path .. " › "
  end

  -- 3. Añadir el icono nativo y el nombre del archivo
  local icon = get_native_icon()
  winbar_str = winbar_str .. "%#WinbarFileIcon#" .. icon .. "%#WinbarFilename#" .. filename

  return winbar_str
end

-- 4. Definición de colores nativos (Modifica los hexadecimales a tu gusto)
vim.api.nvim_set_hl(0, "WinbarBreadcrumb", { fg = "#808080", bg = "NONE" }) -- Gris para la ruta
vim.api.nvim_set_hl(0, "WinbarFileIcon", { fg = "#80A0FF", bg = "NONE" }) -- Azul para el icono
vim.api.nvim_set_hl(0, "WinbarFilename", { fg = "#EEEEEE", bg = "NONE", bold = true }) -- Blanco para el archivo

-- 5. Activación global de la Winbar nativa
vim.opt.winbar = "%{%v:lua.require('ui.winbar').get_winbar()%}"

return M
