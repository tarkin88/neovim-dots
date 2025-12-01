-- Install Lazy.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins.
require('lazy').setup('plugins', {
  ui = { border = 'rounded' },
  install = {
    missing = true,
  },
  defaults = {
    lazy = true,
    version = nil,
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
  -- Don't bother me when tweaking plugins.
  change_detection = { notify = false },
  -- None of my plugins use luarocks so disable this.
  rocks = {
    enabled = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- Stuff I don't use.
      disabled_plugins = {
        'gzip',
        'rplugin',
        'logiPat',
        'matchit',
        'matchparen',
        'netrwFileHandlers',
        'netrwPlugin',
        'netrwSettings',
        'rrhelper',
        'tar',
        'tarPlugin',
        'tohtml',
        'tutor',
        'vimball',
        'zip',
        'zipPlugin',
      },
    },
  },
})
