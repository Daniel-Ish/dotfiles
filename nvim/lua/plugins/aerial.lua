return {
  "stevearc/aerial.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>cs", "<cmd>AerialToggle!<cr>", desc = "Toggle code outline" },
    { "<leader>fa", "<cmd>Telescope aerial<cr>", desc = "Search symbols" },
    { "]a", function() require("aerial").next() end, desc = "Next symbol" },
    { "[a", function() require("aerial").prev() end, desc = "Prev symbol" },
  },
  opts = {
    backends = { "treesitter", "lsp" },
    layout = {
      min_width = 30,
    },
    attach_mode = "global",
    filter_kind = false,
  },
}
