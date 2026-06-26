return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = { "nvim-mini/mini.icons" },
  opts = {
    winopts = {
      height = 0.45,
      width = 0.40,
      preview = {
        hidden = true,
      },
    },
    files = {
      cmd = "fd --type f --hidden --strip-cwd-prefix --exclude .git",
      file_ignore_patterns = {
        "%.git/",
        "COMMIT_EDITMSG",
        "%.git/COMMIT_EDITMSG",
      },
      git_icons = true,
      file_icons = "mini",
    },
    oldfiles = {
      file_icons = "mini",
      file_ignore_patterns = {
        "%.git/",
        "COMMIT_EDITMSG",
      },
    },
    grep = {
      rg_opts = "--hidden --glob '!.git' --column --line-number --no-heading --color=always --smart-case",
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select()
  end,
  keys = {
    { "<leader>f", "", desc = "Search" },
    { "<leader><leader>", "<cmd>FzfLua files<CR>", desc = "Smart Search" },
    { "<C-p>", "<cmd>FzfLua global<CR>", desc = "VSLike" },
    { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "[f]iles" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "[o]ld Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live [g]rep" },
    { "<A-Up>", "<cmd>FzfLua buffers<CR>", desc = "[b]buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<CR>", desc = "[h]elp Tags" },
    { "<leader>ld", "<cmd>FzfLua diagnostics_document<CR>", desc = "[d]iagnostics" },
    { "<leader>lw", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "[w]orkspace diagnostics" },
    { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "[l]sp symbols" },
  },
}
