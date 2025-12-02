local o = vim.opt
local g = vim.g

-- general
g.mapleader = " "
g.maplocalleader = " "
o.mouse = "a" -- enable mouse support
o.undofile = true -- enable persistent undo
o.backup = false -- disable backup
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` textobject part
o.termguicolors = true
o.autoread = true
o.shortmess:append({
  w = true,
  s = true,
})

-- ui
o.winborder = "solid"
o.cursorline = true -- highlight the text line of the cursor
o.number = true -- show numberline
o.relativenumber = true -- show relative numberline
o.signcolumn = "yes" -- always show the sign column
o.cmdheight = 1 -- height of the command bar, default: 1

-- wrapping
o.wrap = true -- soft wrap lines
o.showbreak = "↪ "
o.breakindent = true -- make wrapped lines continue visually indented

-- special UI symbols
o.list = true -- show invisible characters.
o.listchars = "extends:…,nbsp:␣,precedes:…,tab:> ,trail:·"
o.fillchars = "eob: ,fold:┄,foldclose:,foldopen:"

-- statusline
o.laststatus = 3 -- never a statusline
o.cmdheight = 1

-- o.ruler = false -- no position info at cmdline
-- o.showmode = false -- disable showing modes in command line since it's already in the status line

-- splitting
o.splitbelow = true -- splitting a new window below the current one
o.splitright = true -- splitting a new window at the right of the current one
o.splitkeep = "screen"

-- scrolling
o.scrolloff = 15 -- minimum number of lines to keep above and below the cursor.

-- editing
o.updatetime = 200 -- length of time to wait before triggering the plugin
o.timeoutlen = 300 -- shorten key timeout length for which-key
o.inccommand = "split" -- preview substitutions live

-- check spell
o.spell = true
o.spelllang = "en_us,es_mx"

-- indenting
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- number of space inserted for indentation
o.softtabstop = 2 -- number of spaces that a <Tab> counts for.
o.tabstop = 2 -- number of space in a tab
o.smartindent = true -- do smart auto indenting.

-- searching
o.ignorecase = true -- ignore case during search
o.smartcase = true -- respect case if search pattern has upper case
o.hlsearch = true -- highlight search results as you type.

-- folding
o.foldmethod = "indent"
o.foldmarker = "{{{,}}}" -- this is the default
o.foldlevel = 10 -- start with all fold open by default
-- o.foldlevelstart = 0 -- open files with folds closed
o.foldnestmax = 10 -- Limit number of fold levels
o.foldtext = "" -- Show text under fold with its highlighting

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- -- ╭──────────────────────────────────────────────────────────╮
-- -- │ ⬇️ Experimental, Neovim 0.12                             │
-- -- ╰──────────────────────────────────────────────────────────╯
--
-- vim.schedule(function()
--   require('vim._extui').enable({
--     enable = true,
--     msg = {
--       target = 'msg',
--       timeout = 6000,
--     },
--   })
--   vim.api.nvim_create_autocmd('FileType', {
--     pattern = 'msg',
--     callback = function()
--       vim.opt_local.winblend = 50
--       vim.opt_local.winborder = 'none'
--       vim.opt_local.winhighlight = 'Normal:Comment,FloatBorder:Normal'
--     end,
--   })
-- end)
