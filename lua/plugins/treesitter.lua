return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  version = false,
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {
        -- Avoid the sticky context from growing a lot.
        max_lines = 3,
        -- Match the context lines to the source code.
        multiline_threshold = 1,
        -- Disable it when the window is too small.
        min_window_height = 20,
      },
    },
  },
  opts = {
    auto_install = true,
    sync_install = false,
    ensure_installed = {
      'bash',
      'fish',
      'gitcommit',
      'graphql',
      'javascript',
      'json',
      'json5',
      'jsonc',
      'lua',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'rasi',
      'regex',
      'toml',
      'tsx',
      'typescript',
      'yaml',
    },
    highlight = { enable = true },
    indent = {
      enable = true,
      -- Treesitter unindents Yaml lists for some reason.
      disable = { 'yaml' },
    },
  },
}
