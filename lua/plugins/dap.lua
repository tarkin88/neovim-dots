return {
  {
    "mfussenegger/nvim-dap",
    ft = { "python" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      {
        "igorlfs/nvim-dap-view",
        opts = {
          winbar = {
            default_section = "scopes",
            controls = {
              enabled = true,
            },
          },
          windows = {
            size = 0.40,
            position = "below",
          },
          auto_toggle = true,
        },
      },
      "mfussenegger/nvim-dap-python",
    },
    cmd = { "DapContinue", "DapStepOver", "DapStepInto", "DapStepOut", "DapToggleBreakpoint", "DapREPL", "DapUI" },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Start/Continue" },
      { "<F9>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
    },
    config = function()
      local dap = require("dap")
      -- local dapui = require("dapui")
      local dap_python = require("dap-python")

      vim.cmd("hi DapBreakpointColor guifg=#E37C68")

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = " ", texthl = "DapBreakpointColor", linehl = "DapBreakpointColor", numhl = "DapBreakpointColor" }
      )

      local function get_python_path()
        local venv = os.getenv("VIRTUAL_ENV")
        if venv and #venv > 0 then return venv .. "/bin/python" end

        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then return cwd .. "/.venv/bin/python" end
        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then return cwd .. "/venv/bin/python" end

        return vim.fn.exepath("python3") or vim.fn.exepath("python")
      end

      local python_debug = get_python_path()
      dap_python.setup(python_debug)
    end,
  },
}
