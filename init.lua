local profiler = require('utils.profiler')

-- profiler.start('colorscheme')
-- vim.cmd.colorscheme('retrobox')
-- profiler.stop('colorscheme')

profiler.start('options')
require('core.options')
profiler.stop('options')

profiler.start('mappings')
require('core.mappings')
profiler.stop('mappings')

profiler.start('autocmds')
require('core.autocmds')
profiler.stop('autocmds')

-- profiler.start ("statusline")
-- require("core.statusline")
-- profiler.stop("statusline")

profiler.start('winbar')
require('core.winbar')
profiler.stop('winbar')

profiler.start('commands')
require('core.commands')
profiler.stop('commands')

profiler.start('lazy')
require('core.lazy')
profiler.stop('lazy')

profiler.start('lsp')
require('core.lsp')
profiler.stop('lsp')

profiler.report()
