-- -----------------------------------------------------------------------------
-- > Keybinds
-- -----------------------------------------------------------------------------

local map = vim.keymap.set
map("n", "<Esc>", "<Cmd> nohlsearch <CR>", { desc = "Hide search highlight" })
map("n", "<Leader>tr", "<Cmd> set relativenumber! <CR>", { desc = "Toggle relative line numbers" })
map("n", "grf", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "grd", vim.lsp.buf.definition, { desc = "Definitions" })
map("n", "grD", vim.lsp.buf.declaration, { desc = "Declarations" })
