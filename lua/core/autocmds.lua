vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', { clear = true }),
  desc = 'Highlight on yank',
  callback = function() vim.hl.on_yank({ higroup = 'Visual' }) end,
})

vim.api.nvim_create_autocmd('BufRead', {
  desc = 'Syntax highlight for env files',
  group = vim.api.nvim_create_augroup('dotenv', { clear = true }),
  pattern = { '.env', '.env.*', '.secrets' },
  callback = function() vim.bo.filetype = 'dosini' end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Restore cursor to last edit position',
  group = vim.api.nvim_create_augroup('restore_cursor_position', { clear = true }),
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

local line_numbers_group = vim.api.nvim_create_augroup('toggle_line_numbers', {})
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'CmdlineLeave', 'WinEnter' }, {
  group = line_numbers_group,
  desc = 'Toggle relative line numbers on',
  callback = function()
    if vim.wo.nu and not vim.startswith(vim.api.nvim_get_mode().mode, 'i') then vim.wo.relativenumber = true end
  end,
})
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'CmdlineEnter', 'WinLeave' }, {
  group = line_numbers_group,
  desc = 'Toggle relative line numbers off',
  callback = function(args)
    if vim.wo.nu then vim.wo.relativenumber = false end

    -- Redraw here to avoid having to first write something for the line numbers to update.
    if args.event == 'CmdlineEnter' then
      if not vim.tbl_contains({ '@', '-' }, vim.v.event.cmdtype) then vim.cmd.redraw() end
    end
  end,
})
