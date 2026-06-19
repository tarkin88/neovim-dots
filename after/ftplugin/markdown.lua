-- Ensure settings only apply to the current Markdown buffer
local set = vim.opt_local

-- 1. Text Wrap & Formatting
set.wrap = true -- Enable soft line wrapping
set.linebreak = true -- Wrap lines at words instead of hard characters
set.breakindent = true -- Maintain indentation when wrapping lines

-- 2. Spelling & Language
-- set.spell = true -- Turn on spell checking
-- set.spelllang = "en_us,es_mx" -- Set dictionary language

-- 3. Visuals & Concealing
-- set.conceallevel = 2 -- Hide markdown symbols (like **, links) unless editing

-- 4. Tabs & Indentation
set.tabstop = 4 -- Number of spaces that a <Tab> counts for
set.shiftwidth = 4 -- Number of spaces to use for each step of auto-indent
set.expandtab = true -- Convert tabs to spaces

-- 5. Define Fenced Code Block Highlighting
-- Enables full syntax highlighting for language blocks inside triple backticks
vim.g.markdown_fenced_languages = {
  "python",
  "bash",
  "lua",
}
