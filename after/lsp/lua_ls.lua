---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      completion = {
        enable = true,
        callSnippet = "Replace",
      },
      codeLens = {
        enable = true,
      },
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        enable = true,
        globals = { "vim" },
        disable = { "missing-fields" },
      },
      doc = {
        privateName = { "^_" },
      },
      workspace = {
        checkThirdParty = false,
        ignoreSubmodules = true,
        library = { vim.env.VIMRUNTIME },
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
    },
  },
}
