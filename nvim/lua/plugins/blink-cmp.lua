return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
        ["<M-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        documentation = { auto_show = true },
      },
    },
  },
}
