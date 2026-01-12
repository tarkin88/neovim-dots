-- -----------------------------------------------------------------------------
-- > Options
-- -----------------------------------------------------------------------------
local arrows = require("icons").arrows

vim.g.mapleader = " " -- Set the leader key prefix
-- vim.opt.clipboard:append("unnamedplus") -- Use the system clipboard for all operations
vim.opt.shortmess:append({
  w = true, -- Shorten the message for the "written" file status
  s = true, -- Shorten "[Search]" messages.
  I = true, -- disable welcome message
})
vim.opt.undofile = true -- enable persistent undo
vim.opt.backup = false -- disable backup
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` text-object part

vim.opt.number = true -- Column with line number
vim.opt.relativenumber = true -- Use relative line numbers
vim.opt.colorcolumn = "80" -- Column at "x" chars
vim.opt.signcolumn = "yes" -- Column for git status, diagnostics, etc.
vim.opt.laststatus = 3 -- Single status-line
vim.opt.cursorline = true -- Highlight the entire current line
vim.opt.winborder = "rounded" -- Set float borders
vim.opt.pumborder = "rounded" -- Set pop-up menu borders
vim.opt.termguicolors = true -- Force enable 24-bit RGB color
vim.opt.wrap = false -- Don't break lines
vim.opt.scrolloff = 15 -- Lines to keep above/below cursor
vim.opt.sidescrolloff = 10 -- Lines to keep left/right cursor
vim.opt.splitbelow = true -- Open splits below current
vim.opt.splitright = true -- Open split right of current
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.hlsearch = true -- highlight search results as you type.
vim.opt.smartcase = true -- Fallback to exact case, when upper case is used
vim.opt.inccommand = "split" -- preview substitutions live
vim.opt.spell = true -- enable spelling
vim.opt.spelllang = "en_us,es_mx" -- set spelling languages
vim.opt.expandtab = true -- Expand real tabs to spaces
vim.opt.shiftwidth = 2 -- Width of one indent level
vim.opt.softtabstop = -1 -- Width of one tab key-press (-1 = same as shift-width)
vim.opt.tabstop = 2 -- Width of a real tab character
vim.opt.autoindent = true -- Use the indent from the previous line
vim.opt.smartindent = true -- Attempt to do c-style indentation

vim.opt.list = true -- Show hidden characters as:
vim.opt.showbreak = "↪ "
vim.opt.listchars = {
  space = " ",
  tab = "  ",
  trail = ".",
  nbsp = " ",
  precedes = "<",
  extends = ">",
}

-- folding
vim.opt.foldcolumn = "1"
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 10
vim.wo.foldtext = " "
vim.opt.fillchars = {
  fold = " ",
  foldclose = arrows.right,
  foldopen = arrows.down,
  foldsep = " ",
  foldinner = " ",
}

-- vim.schedule(function()
--   require('vim._extui').enable({
--     enable = true,
--     msg = {
--     target = 'msg',
--     timeout = 6000,
--     },
--   })
-- end)

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
