return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format file/selection",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_organize_imports", "ruff_format" },
    },
    format_on_save = false,
  },
  init = function()
    local mr = require("mason-registry")
    if not mr.is_installed("ruff") then
      mr.get_package("ruff"):install()
    end
  end,
}
