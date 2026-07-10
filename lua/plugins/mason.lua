return {
  "mason-org/mason.nvim",
  lazy = false,
  opts = {
    ui = {
      border = "rounded",
    },
    max_concurrent_installers = 5,
  },
  config = function(_, opts)
    vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

    require("mason").setup(opts)

    local ensure_installed = {
      "basedpyright",
      "bash-language-server",
      "codespell",
      "css-lsp",
      "docker-language-server",
      "json-lsp",
      "lua-language-server",
      "markdown-oxide",
      "prettier",
      "ruff",
      "shellcheck",
      "shfmt",
      "postgres-language-server",
      "pgformatter",
      "stylua",
      "taplo",
      "tree-sitter-cli",
      "yaml-language-server",
    }
    local mr = require("mason-registry")

    for _, tool in ipairs(ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then p:install() end
    end
  end,
}
