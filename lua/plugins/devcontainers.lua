return {
  "https://codeberg.org/esensar/nvim-dev-container",
  events = { "DevcontainerStart", "DevcontainerLogs" },
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    log_level = "debug",
    terminal_handler = function(command)
      local laststatus = vim.o.laststatus
      vim.cmd("tabnew")
      local bufnr = vim.api.nvim_get_current_buf()
      vim.o.laststatus = 0
      local au_id = vim.api.nvim_create_augroup("devcontainer.docker.terminal", {})
      vim.api.nvim_create_autocmd("BufEnter", {
        buffer = bufnr,
        group = au_id,
        callback = function()
          vim.o.laststatus = 0
          vim.cmd("set lines+=1")
        end,
      })
      vim.api.nvim_create_autocmd("BufLeave", {
        buffer = bufnr,
        group = au_id,
        callback = function()
          vim.o.laststatus = laststatus
          vim.cmd("set lines-=1")
        end,
      })
      vim.api.nvim_create_autocmd("BufDelete", {
        buffer = bufnr,
        group = au_id,
        callback = function()
          vim.o.laststatus = laststatus
          vim.cmd("set lines-=1")
          vim.api.nvim_del_augroup_by_id(au_id)
        end,
      })
      local job_id = vim.fn.jobstart(command, {
        pty = true,
        cwd = vim.fn.getcwd(),
      })
      if job_id > 0 then
        local channel_id = vim.fn.job_getchannel(job_id)
        vim.api.nvim_open_term(bufnr, {
          on_input = function(_, _, _, _) end,
        })
        vim.api.nvim_chan_send(channel_id, "")
      end
    end,
  },
  keys = {
    { "<F12>", "<cmd>DevcontainerStart<cr>", desc = "start devcontainers" },
  },
}
