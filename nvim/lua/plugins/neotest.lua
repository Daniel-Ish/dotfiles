local function get_python_path()
  local venv = vim.fn.getcwd() .. "/venv/bin/python"
  if vim.fn.executable(venv) == 1 then
    return venv
  end
  return "python3"
end

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  ft = { "python" },
  keys = {
    -- Run
    { "<leader>tn", function() require("neotest").run.run() end, desc = "Test nearest" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test file" },
    {
      "<leader>td",
      function()
        local default_dir = vim.fn.expand("%:p:h")
        local dir = vim.fn.input("Test directory: ", default_dir, "dir")
        if dir ~= "" then
          require("neotest").run.run(dir)
        end
      end,
      desc = "Test directory",
    },
    { "<leader>ts", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Test suite" },
    -- Results
    { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Test output panel" },
    { "<leader>tS", function() require("neotest").summary.toggle() end, desc = "Test summary" },
    -- Control
    { "<leader>tx", function() require("neotest").run.stop() end, desc = "Stop test" },
    { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Test last" },
    -- Debug (integrates with existing dap.lua)
    {
      "<leader>tD",
      function() require("neotest").run.run({ strategy = "dap" }) end,
      desc = "Debug nearest test",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          python = get_python_path(),
          runner = "pytest",
        }),
      },
    })
  end,
}
