vim.opt_local.spell = true
vim.opt.spelllang = "en_us" -- set spelling languages
vim.opt.colorcolumn = "72" -- Column at "x" chars
vim.cmd([[match OverLength '/\%>72v.\+/']])
vim.cmd([[highlight OverLength ctermbg=red guibg=red]])
