return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Open buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
    { "<leader>fs", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document symbols" },
    { "<leader>fS", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "Workspace symbols" },
    { "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
    { "<leader>fc", function() require("telescope.builtin").git_commits() end, desc = "Git commits" },
    { "<leader>fB", function() require("telescope.builtin").git_branches() end, desc = "Git branches" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "%.pyc", "__pycache__", "%.git/", "venv/", "node_modules", "migrations/" },
      },
    })
    telescope.load_extension("fzf")
  end,
}
