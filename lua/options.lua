-- -----------------------------------------------------------------------------
-- > Options
-- -----------------------------------------------------------------------------
-- local opt = vim.opt
-- local g = vim.g
--
-- g.mapleader = " " -- Set the leader key prefix
-- -- opt.clipboard:append("unnamedplus") -- Use the system clipboard for all operations
-- opt.shortmess:append({
--   w = true, -- Shorten the message for the "written" file status
--   s = true, -- Shorten "[Search]" messages.
--   I = true, -- disable welcome message
-- })
-- opt.shada:append("r/\\.git/")
-- opt.shada:append("rCOMMIT_EDITMSG")
-- opt.undofile = true -- enable persistent undo
-- opt.backup = false -- disable backup
-- opt.swapfile = false -- Disable swap files
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- opt.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` text-object part
--
-- opt.number = true -- Column with line number
-- opt.relativenumber = true -- Use relative line numbers
-- opt.numberwidth = 2 -- Width of the line number column
-- opt.colorcolumn = "80" -- Column at "x" chars
-- opt.signcolumn = "yes:1" -- Column for git status, diagnostics, etc.
-- opt.laststatus = 3 -- Single status-line
-- opt.cursorline = true -- Highlight the entire current line
-- opt.winborder = "rounded" -- Set float borders
-- opt.pumborder = "rounded" -- Set pop-up menu borders
-- opt.termguicolors = true -- Force enable 24-bit RGB color
-- opt.wrap = false -- Don't break lines
-- opt.scrolloff = 10 -- Lines to keep above/below cursor
-- opt.sidescrolloff = 10 -- Lines to keep left/right cursor
-- opt.splitbelow = true -- Open splits below current
-- opt.splitright = true -- Open split right of current
-- opt.ignorecase = true -- Ignore case when searching
-- opt.hlsearch = true -- highlight search results as you type.
-- opt.smartcase = true -- Fallback to exact case, when upper case is used
-- opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
-- opt.spell = true -- enable spelling
-- opt.spelllang = "en_us,es_mx" -- set spelling languages
-- opt.expandtab = true -- Expand real tabs to spaces
-- opt.shiftwidth = 2 -- Width of one indent level
-- opt.softtabstop = -1 -- Width of one tab key-press (-1 = same as shift-width)
-- opt.tabstop = 2 -- Width of a real tab character
-- opt.autoindent = true -- Use the indent from the previous line
-- opt.smartindent = true -- Attempt to do c-style indentation
--
-- opt.list = true -- Show hidden characters as:
-- opt.showbreak = "↪ "
-- opt.listchars = {
--   space = " ",
--   tab = "  ",
--   trail = ".",
--   nbsp = " ",
--   precedes = "<",
--   extends = ">",
-- }
--
-- -- folding
-- opt.foldcolumn = "1"
-- opt.foldlevelstart = 99
-- opt.foldlevel = 10
-- vim.wo.foldtext = " "
-- opt.fillchars = {
--   fold = " ",
--   foldclose = "",
--   foldopen = "",
--   foldsep = " ",
--   foldinner = " ",
-- }
-- -- file explorer
-- g.netrw_liststyle = 3
-- g.netrw_banner = 0
-- g.netrw_fastbrowse = 2
-- g.netrw_winsize = 20
-- g.netrw_browse_split = 4
-- g.netrw_left = 1
-- -- Disable health checks for these providers.
-- g.loaded_python3_provider = 0
-- g.loaded_ruby_provider = 0
-- g.loaded_perl_provider = 0
-- g.loaded_node_provider = 0
--
--
-- ███╗   ██║███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: options.lua
-- Description: General Neovim settings and configuration
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>

local opt = vim.opt
local g = vim.g

-- ─── Leader ──────────────────────────────────────────────────────────────
g.mapleader = " "
g.maplocalleader = " "

-- ─── Clipboard ───────────────────────────────────────────────────────────
-- Schedule to avoid slowing up startup
-- vim.schedule(function() vim.o.clipboard = "unnamedplus" end)

-- ─── General ─────────────────────────────────────────────────────────────
opt.backup = false
opt.breakindent = true
opt.confirm = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --smart-case"
opt.history = 500
opt.inccommand = "split"
opt.lazyredraw = false -- deprecated; use eventignore when needed
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.mouse = "a"
opt.redrawtime = 1500
opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"
opt.showmode = false
opt.sidescrolloff = 3
opt.syntax = "enable"
opt.timeoutlen = 250
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.writebackup = false

-- ─── Indentation ─────────────────────────────────────────────────────────
local indent = 4
opt.autoindent = true
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = indent
opt.smartindent = true
opt.softtabstop = indent
opt.tabstop = indent

-- ─── Search ──────────────────────────────────────────────────────────────
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wildignore = { "*/node_modules/*", "*/.git/*", "*/vendor/*", "*/.hg/*", "*/.svn/*" }
opt.wildmenu = true

-- ─── UI ──────────────────────────────────────────────────────────────────
opt.cmdheight = 0
opt.completeopt = { "menu", "menuone", "noselect" }
opt.cursorline = true
opt.laststatus = 3 -- global statusline (more performant than 2)
opt.number = true
opt.pumheight = 10
opt.scrolloff = 18
opt.showtabline = 2
opt.signcolumn = "yes"
opt.shortmess:append({ c = true, W = true, I = true })
opt.splitbelow = true
opt.splitkeep = "cursor"
opt.splitright = true
opt.winborder = "rounded"
opt.winminwidth = 5
opt.wrap = true
opt.colorcolumn = "80"

-- ─── List chars ──────────────────────────────────────────────────────────
opt.list = true
opt.listchars = {
  tab = "┊ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×",
}

-- ─── Folds ───────────────────────────────────────────────────────────────
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldnestmax = 10

-- ─── Swap / Undo ─────────────────────────────────────────────────────────
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.undolevels = 10000
opt.undoreload = 10000

-- ─── Backspace ───────────────────────────────────────────────────────────
opt.backspace = { "eol", "start", "indent" }

-- ─── Completion ──────────────────────────────────────────────────────────
opt.complete = ".,w,b,kspell"

-- ─── Spell  ──────────────────────────────────────────────────────────

opt.spell = true -- enable spelling
opt.spelllang = "en_us,es_mx" -- set spelling languages
-- ─── Disable unnecessary built-in plugins for speed ─────────────────────
local disabled = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "compiler",
  "bugreport",
  "ftplugin",
}
for _, name in ipairs(disabled) do
  g["loaded_" .. name] = 1
end

-- ─── Colorscheme ─────────────────────────────────────────────────────────
-- Will be set by lazy.nvim after plugins are installed

-- ─── Diagnostics (Neovim 0.11+) ─────────────────────────────────────────
if vim.fn.has("nvim-0.11") > 0 then
  vim.diagnostic.config({
    severity_sort = true,
    underline = false,
    update_in_insert = false,
    virtual_lines = { current_line = true },
  })
end

-- ─── Popup menu border (Neovim 0.12+) ───────────────────────────────────
if vim.fn.has("nvim-0.12") > 0 then opt.pumborder = "rounded" end
