local csvview = require("csvview")

local filename = vim.api.nvim_buf_get_name(0)

local stat = vim.loop.fs_stat(filename)
local max_mb = 10

if stat then
  local max_size = 1024 * 1024 * max_mb

  if stat.size <= max_size then csvview.enable() end
end
