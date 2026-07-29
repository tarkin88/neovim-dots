-- -----------------------------------------------------------------------------
-- > Keybinds
-- -----------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

map("n", "<Esc>", "<Cmd> nohlsearch <CR>", { desc = "Hide search highlight" })
map("n", "<Leader>tr", "<Cmd> set relativenumber! <CR>", { desc = "Toggle relative line numbers" })
map("n", "<Leader>_", "<cmd>vsplit<CR>", opts) -- Split the window vertically
map("n", "<Leader>-", "<cmd>split<CR>", opts) -- Split the window horizontally

map("n", "<Leader>s", "", { desc = "s[c]ratchpad" })
map("n", "<Leader>ss", "<cmd>Scratchpad<cr>", { desc = "[s]cratchpad" })
map("n", "<Leader>sl", "<cmd>ListScratchpads<cr>", { desc = "[l]ist cratchpads" })

map("n", "<Leader>t", "", { desc = "[t]abs" })
map("n", "<Leader>te", "<cmd>tabnew<CR>", opts) -- Open a new tab
map("n", "<Leader>tx", "<cmd>tabclose<CR>", opts) -- Close the current tab   )
map("n", "<Leader>to", "<cmd>tabonly<CR>", opts) -- Close all other tabs
map("n", "<Leader>tn", "<cmd>tabnext<CR>", opts) -- Go to the next tab
map("n", "<Leader>tp", "<cmd>tabprevious<CR>", opts)

map("n", "<C-j>", "<Esc>:m .+1<CR>==", opts) -- Move text up
map("n", "<C-k>", "<Esc>:m .-2<CR>==", opts) -- Move text down

map("n", "<leader>u", "", { desc = "[l]azy manager" })
map("n", "<leader>uu", "<cmd>Lazy sync<cr>", { desc = "[u]pdate" })
map("n", "<leader>uc", "<cmd>Lazy check<cr>", { desc = "[c]heck" })
map("v", "<Leader>p", '"_dP', opts) -- Paste without overwriting the default register
map("v", "<leader>y", '"+y', { desc = "Copy yank to clipboard", noremap = true })
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "<A-Down>", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
map("n", "<A-Left>", "<cmd>bprev<CR>", { desc = "go to prev buffer" })
map("n", "<A-Right>", "<cmd>bnext<CR>", { desc = "go to next buffer" })

vim.keymap.set("n", "<leader>\\", function()
  local height = math.floor(vim.o.lines / 3)
  vim.cmd("belowright split | resize " .. height .. " | terminal")
end, { desc = "open terminal" })
