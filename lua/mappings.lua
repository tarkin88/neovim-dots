-- -----------------------------------------------------------------------------
-- > Keybinds
-- -----------------------------------------------------------------------------

local map = vim.keymap.set
map("n", "<Esc>", "<Cmd> nohlsearch <CR>", { desc = "Hide search highlight" })
map("n", "<Leader>tr", "<Cmd> set relativenumber! <CR>", { desc = "Toggle relative line numbers" })
map("n", "<Leader>_", "<cmd>vsplit<CR>", { silent = true }) -- Split the window vertically
map("n", "<Leader>-", "<cmd>split<CR>", { silent = true }) -- Split the window horizontally
map("n", "<Leader>te", "<cmd>tabnew<CR>", { silent = true }) -- Open a new tab

map("n", "<leader>uu", "<cmd>Lazy sync<cr>", { desc = "update" })
map("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
map("v", "<leader>y", '"+y', { desc = "Copy yank to clipboard", noremap = true })
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "<A-Down>", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
map("n", "<A-Left>", "<cmd>bprev<CR>", { desc = "go to prev buffer" })
map("n", "<A-Right>", "<cmd>bnext<CR>", { desc = "go to next buffer" })
