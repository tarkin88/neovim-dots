-- -----------------------------------------------------------------------------
-- > Autocommands
-- -----------------------------------------------------------------------------
-- Highlight text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- env file as dosini
vim.api.nvim_create_autocmd("BufRead", {
  desc = "Syntax highlight for env files",
  group = vim.api.nvim_create_augroup("dotenv", { clear = true }),
  pattern = { ".env", ".env.*", ".secrets" },
  callback = function() vim.bo.filetype = "dosini" end,
})

-- restore position
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore cursor to last edit position",
  group = vim.api.nvim_create_augroup("restore_cursor_position", { clear = true }),
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- relative numbers on focus
local line_numbers_group = vim.api.nvim_create_augroup("toggle_line_numbers", {})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  group = line_numbers_group,
  desc = "Toggle relative line numbers on",
  callback = function()
    if vim.wo.nu and not vim.startswith(vim.api.nvim_get_mode().mode, "i") then vim.wo.relativenumber = true end
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  group = line_numbers_group,
  desc = "Toggle relative line numbers off",
  callback = function(args)
    if vim.wo.nu then vim.wo.relativenumber = false end

    -- Redraw here to avoid having to first write something for the line numbers to update.
    if args.event == "CmdlineEnter" then
      if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then vim.cmd.redraw() end
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("big_file", { clear = true }),
  desc = "Disable features in big files",
  pattern = "bigfile",
  callback = function(args)
    vim.schedule(function() vim.bo[args.buf].syntax = vim.filetype.match({ buf = args.buf }) or "" end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  desc = "Close with <q>",
  pattern = {
    "git",
    "help",
    "man",
    "qf",
    "scratch",
  },
  callback = function(args)
    if args.match ~= "help" or not vim.bo[args.buf].modifiable then
      vim.keymap.set("n", "q", "<cmd>quit<cr>", { buffer = args.buf })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_folding", { clear = true }),
  desc = "Enable Treesitter folding",
  callback = function(args)
    local bufnr = args.buf

    -- Enable Treesitter folding when not in huge files and when Treesitter
    -- is working.
    if vim.bo[bufnr].filetype ~= "bigfile" and pcall(vim.treesitter.start, bufnr) then
      vim.api.nvim_buf_call(bufnr, function()
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.cmd.normal("zx")
      end)
    end
  end,
})

local LARGE_FILE = 1024 * 1024

local function is_large_file(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" then return false end
  local ok, stats = pcall(vim.loop.fs_stat, name)
  if not ok or not stats then return false end
  return stats.size > LARGE_FILE
end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local bufnr = args.buf
    if not is_large_file(bufnr) then return end

    -- Treesitter off
    pcall(vim.treesitter.stop, bufnr)
    vim.bo[bufnr].syntax = "off"

    -- LSP off
    for _, client in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
      client.stop()
    end

    -- Diagnostics off
    vim.diagnostic.enable(false, { bufnr = bufnr })

    vim.bo[bufnr].swapfile = false
    vim.wo[0].foldmethod = "manual"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function(ev)
    -- commando local al buffer
    vim.api.nvim_buf_create_user_command(
      ev.buf,
      "GenCommit",
      function() require("commands").gen_commit_for_buf(ev.buf) end,
      { desc = "Generate commit message with Copilot CLI" }
    )

    vim.schedule(function()
      local answer = vim.fn.confirm("Auto-generate git message with Copilot?", "&Yes\n&No", 1)
      if answer == 1 then require("commands").gen_commit_for_buf(ev.buf) end
    end)
  end,
})
