return {
  "abhilash26/zenline.nvim",
  event = { "WinEnter", "BufEnter", "ColorScheme" },
  opts = {
    components = {

      mode = {
        ["n"] = { "ZenlineNormal", "N" },
        ["i"] = { "ZenlineInsert", "I" },
        ["ic"] = { "ZenlineInsert", "I" },
        ["v"] = { "ZenlineVisual", "V" },
        ["V"] = { "ZenlineVisual", "VL" },
        ["^V"] = { "ZenlineVisual", "VB" },
        ["c"] = { "ZenlineCmdLine", "C" },
        ["R"] = { "ZenlineReplace", "R" },
        ["t"] = { "ZenlineTerminal", "T" },
        default = { "Normal", "UNKNOWN" },
      },

      diagnostics = {
        ["ERROR"] = { "ZenlineError", "x " },
        ["WARN"] = { "ZenlineWarn", " " },
        ["INFO"] = { "ZenlineInfo", " " },
        ["HINT"] = { "ZenlineHint", " " },
      },
    },
    sections = {
      active = {
        left = { "mode", "git_branch", "git_diff" },
        center = { "file_name" },
        right = { "diagnostics", "file_type", "line_column" },
      },
    },
  },
}
