-- -----------------------------------------------------------------------------
-- > Keybinds
-- -----------------------------------------------------------------------------

local map = vim.keymap.set
map("n", "<Esc>", "<Cmd> nohlsearch <CR>", { desc = "Hide search highlight" })
map("n", "<Leader>tr", "<Cmd> set relativenumber! <CR>", { desc = "Toggle relative line numbers" })
map("n", "<Leader>ff", "<Cmd> Pick files <CR>", { desc = "Find files" })
map("n", "<Leader>fF", "<Cmd> Pick all_files <CR>", { desc = "Find all files" })
map("n", "<Leader>sg", "<Cmd> Pick grep_live <CR>", { desc = "Search by grep" })
map("n", "<Leader>sr", "<Cmd> Pick resume <CR>", { desc = "Search resume" })
map("n", "<Leader>sh", "<Cmd> Pick help <CR>", { desc = "Search help" })
map("n", "<Leader>sk", "<Cmd> Pick keymaps <CR>", { desc = "Search keymaps" })
map("n", "<Leader>/", "<Cmd> Pick buf_lines <CR>", { desc = "Search buffer lines" })
map("n", '<Leader>"', "<Cmd> Pick registers <CR>", { desc = "Search registers" })
map("n", "<Leader><Leader>", "<Cmd> Pick buffers <CR>", { desc = "Search open buffers" })
map("n", "<Leader>e", function() return MiniFiles.close() or MiniFiles.open() end, { desc = "File explorer" })
map("n", "grf", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "grd", vim.lsp.buf.definition, { desc = "Definitions" })
map("n", "grD", vim.lsp.buf.declaration, { desc = "Declarations" })

map("n", "<C-h>", "<Cmd><C-U>TmuxNavigateLeft<CR>", { desc = "Navigate left" })
map("n", "<C-j>", "<Cmd><C-U>TmuxNavigateDown<CR>", { desc = "Navigate down" })
map("n", "<C-k>", "<Cmd><C-U>TmuxNavigateUp<CR>", { desc = "Navigate up" })
map("n", "<C-l>", "<Cmd><C-U>TmuxNavigateRight<CR>", { desc = "Navigate right" })
map("n", "<C-\\>", "<Cmd><C-U>TmuxNavigatePrevious<CR>", { desc = "Navigate previous" })
