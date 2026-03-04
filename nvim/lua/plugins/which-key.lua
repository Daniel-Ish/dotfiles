return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup()
    wk.add({
      { "<leader>b", group = "buffer" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "session" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "debug" },
      { "<leader>r", group = "run" },
      { "g", group = "goto" },
      { "]", group = "next" },
      { "[", group = "prev" },
    })
  end,
  keys = {
    { "<leader>?", function() require("which-key").show() end, desc = "Keymaps" },
  },
}
