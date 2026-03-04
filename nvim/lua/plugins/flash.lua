return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter search" },
  },
  opts = {
    modes = {
      char = {
        enabled = true,
      },
    },
  },
}
