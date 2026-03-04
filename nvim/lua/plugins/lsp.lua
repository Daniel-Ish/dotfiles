return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "basedpyright" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "saghen/blink.cmp" },
    config = function()
      vim.diagnostic.config({
        underline = false,
        virtual_text = false,
        signs = false,
      })

      vim.lsp.config("basedpyright", {})
      vim.lsp.enable("basedpyright")

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "References")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<leader>ca", vim.lsp.buf.code_action, "Code actions")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>go", function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols({ default_text = vim.fn.expand("<cword>") })
          end, "Go to overrides")
          map("<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
          map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
        end,
      })
    end,
  },
}
