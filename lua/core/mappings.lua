local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- NORMAL
map('n', '<c-q>', '<cmd>confirm quit<cr>', { desc = '[q]uit' })
map('n', '<c-s>', '<cmd>update<cr>', { desc = '[w]rite' })
map('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = '[r]emove highlight from search', noremap = true })

map('n', '<leader>|', '<cmd>vsplit<cr>', { desc = '[v]ertical split', noremap = true })
map('n', '<leader>_', '<cmd>split<cr>', { desc = '[h]orizontal split', noremap = true })

map('n', '<A-Right>', '<cmd>bprevious<cr>', opts)
map('n', '<A-Left>', '<cmd>bnext<cr>', opts)
map('n', '<A-Down>', '<cmd>bdelete<cr>', opts)
map('n', '<leader>t', '<cmd>botright new | resize 14 | terminal<cr>', { desc = 'vscode like terminal', noremap = true })
map('n', 'U', '<C-r>', { desc = 'Redo' })

-- VISUAL
map('v', '<C-c>', '"+y', { desc = 'Copy yank to clipboard', noremap = true })
map('v', 'p', '"_dP', { desc = 'better paste', noremap = true })
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
-- Quickly go to the end of the line while in insert mode.
map({ 'i', 'c' }, '<C-l>', '<C-o>A', { desc = 'Go to the end of the line' })
