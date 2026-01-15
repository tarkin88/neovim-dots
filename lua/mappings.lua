-- -----------------------------------------------------------------------------
-- > Keybinds
-- -----------------------------------------------------------------------------

local map = vim.keymap.set
map("n", "<Esc>", "<Cmd> nohlsearch <CR>", { desc = "Hide search highlight" })
map("n", "<Leader>tr", "<Cmd> set relativenumber! <CR>", { desc = "Toggle relative line numbers" })
map("n", "<Leader>_", "<cmd>vsplit<CR>", { silent = true }) -- Split the window vertically
map("n", "<Leader>-", "<cmd>split<CR>", { silent = true }) -- Split the window horizontally
map("n", "<Leader>te", "<cmd>tabnew<CR>", { silent = true }) -- Open a new tab

map("n", "<leader>uu", "<cmd> lua vim.pack.update() <cr>", { desc = "update" })
map("n", "<leader>uc", function() require("commands").packclean() end, { desc = "clean inactive packages" })
map("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
map("v", "<leader>y", '"+y', { desc = "Copy yank to clipboard", noremap = true })

map("n", "<Leader>e", function() require("commands").toggle_netrw() end, { desc = "toggle Netwr" })
map("n", "<Leader>bd", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
