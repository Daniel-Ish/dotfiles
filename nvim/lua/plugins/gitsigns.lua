return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 200,
    },
  },
  keys = {
    -- blame
    { "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Blame (full file)" },
    { "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Blame (inline toggle)" },
    -- hunk navigation
    { "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
    { "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev hunk" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
    { "<leader>gd", function() require("gitsigns").diffthis("HEAD") end, desc = "Diff file" },
    -- stage / reset
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk", mode = { "n", "v" } },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Unstage hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk", mode = { "n", "v" } },
    { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage buffer" },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset buffer" },
  },
}
