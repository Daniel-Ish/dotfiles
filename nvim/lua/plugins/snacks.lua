return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    indent = {
      enabled = true,
    },
    notifier = {
      enabled = true,
    },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua require('telescope.builtin').find_files()" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua require('telescope.builtin').live_grep()" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('telescope.builtin').oldfiles()" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "c", desc = "Config", action = ":lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    lazygit = { enabled = true },
    terminal = { enabled = true },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit File Log" },
    { "<c-_>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },
  },
}
