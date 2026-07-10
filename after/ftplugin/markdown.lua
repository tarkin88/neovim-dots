-- Ensure settings only apply to the current Markdown buffer
local set = vim.opt_local

-- 1. Text Wrap & Formatting
set.wrap = true -- Enable soft line wrapping
set.linebreak = true -- Wrap lines at words instead of hard characters
set.breakindent = true -- Maintain indentation when wrapping lines

-- 5. Define Fenced Code Block Highlighting
-- Enables full syntax highlighting for language blocks inside triple backticks
vim.g.markdown_fenced_languages = {
  "python",
  "bash",
  "lua",
}

-- Markdown uses 2-space indentation (matches markdownlint MD007 default).
-- Overrides the bundled runtime ftplugin which forces tabstop/shiftwidth=4.
-- Structural correctness (ordered-list continuation, code blocks) is handled
-- by the formatter (prettier via conform) on save.
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2

-- Continue list markers on a new line. The bundled markdown ftplugin disables
-- this (formatoptions-=r -=o, plus an "f" flag that only hanging-indents
-- instead of repeating the marker). Drop the "f" flag and re-enable r/o so
-- pressing <CR> (insert) or o/O (normal) on a "- ", "* ", "+ " or "> " line
-- re-inserts the marker.
set.comments = "b:-,b:*,b:+,n:>"
set.formatoptions:append("r")
set.formatoptions:append("o")
