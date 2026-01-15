-- -----------------------------------------------------------------------------
-- > Keybinds
-- -----------------------------------------------------------------------------

local map = vim.keymap.set
map("n", "<Esc>", "<Cmd> nohlsearch <CR>", { desc = "Hide search highlight" })
map("n", "<Leader>tr", "<Cmd> set relativenumber! <CR>", { desc = "Toggle relative line numbers" })

map("n", "<leader>uu", "<cmd> lua vim.pack.update() <cr>", { desc = "update" })
map("n", "<leader>uc", function() require("commands").packclean() end, { desc = "clean inactive packages" })

map("v", "<C-c>", '"+y', { desc = "Copy yank to clipboard", noremap = true })
