local function get_python_path()
  local venv = vim.fn.getcwd() .. "/venv/bin/python"
  if vim.fn.executable(venv) == 1 then
    return venv
  end
  return "python3"
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {},
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)

          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
      },
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          local mason_registry = require("mason-registry")
          if not mason_registry.is_installed("debugpy") then
            mason_registry.get_package("debugpy"):install()
          end
          require("dap-python").setup(vim.fn.expand("$MASON/packages/debugpy/venv/bin/python"))

          local dap = require("dap")
          table.insert(dap.configurations.python, 1, {
            type = "python",
            request = "launch",
            name = "Launch (project)",
            program = "${file}",
            cwd = "${workspaceFolder}",
            env = { PYTHONPATH = "${workspaceFolder}" },
          })
        end,
      },
    },
    ft = { "python" },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Start / Continue" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step out" },
      { "<leader>dr", function() require("dap").restart() end, desc = "Restart" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval expression", mode = { "n", "v" } },
    },
    config = function()
      local signs = {
        DapBreakpoint = { text = "●", texthl = "DiagnosticError" },
        DapBreakpointCondition = { text = "◆", texthl = "DiagnosticWarn" },
        DapLogPoint = { text = "◆", texthl = "DiagnosticInfo" },
        DapStopped = { text = "▶", texthl = "DiagnosticOk", linehl = "DapStoppedLine" },
        DapBreakpointRejected = { text = "○", texthl = "DiagnosticError" },
      }
      for name, sign in pairs(signs) do
        vim.fn.sign_define(name, sign)
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    ft = { "python" },
    keys = {
      {
        "<leader>rx",
        function()
          local file = vim.fn.expand("%:p")
          local py = get_python_path()
          local cwd = vim.fn.shellescape(vim.fn.getcwd())
          local cmd = "PYTHONPATH=" .. cwd .. " " .. py .. " " .. vim.fn.shellescape(file)
          Snacks.terminal.toggle(cmd, { interactive = false })
        end,
        ft = "python",
        desc = "Run current file",
      },
      {
        "<leader>ri",
        function()
          local file = vim.fn.expand("%:p")
          local py = get_python_path()
          local cwd = vim.fn.shellescape(vim.fn.getcwd())
          local cmd = "PYTHONPATH=" .. cwd .. " " .. py .. " -i " .. vim.fn.shellescape(file)
          Snacks.terminal.toggle(cmd)
        end,
        ft = "python",
        desc = "Run file (interactive)",
      },
    },
  },
}
