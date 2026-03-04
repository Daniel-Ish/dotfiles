return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- tree-sitter CLI required: brew install tree-sitter
      if vim.fn.executable("tree-sitter") == 0 then
        vim.notify("tree-sitter CLI not found. Run: brew install tree-sitter", vim.log.levels.WARN)
        return
      end

      -- Only install parsers that are missing
      local wanted = {
        "python", "lua", "vim", "vimdoc", "query",
        "javascript", "typescript", "html", "css", "json", "yaml", "toml",
        "bash", "dockerfile", "markdown", "markdown_inline", "regex", "sql",
      }
      local parser_dir = require("nvim-treesitter.config").get_install_dir("parser")
      local to_install = vim.tbl_filter(function(p)
        return not vim.uv.fs_stat(parser_dir .. "/" .. p .. ".so")
      end, wanted)
      if #to_install > 0 then
        require("nvim-treesitter").install(to_install)
      end

      -- Highlight and indent are built into Neovim; enable via filetype autocmd
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          if pcall(vim.treesitter.start, ev.buf) then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local ts_select = require("nvim-treesitter-textobjects.select")
      local ts_move = require("nvim-treesitter-textobjects.move")

      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      -- Textobject select keymaps
      local select_maps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      }
      local descs = {
        ["af"] = "Around function", ["if"] = "Inside function",
        ["ac"] = "Around class", ["ic"] = "Inside class",
        ["aa"] = "Around argument", ["ia"] = "Inside argument",
      }
      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          ts_select.select_textobject(query)
        end, { desc = descs[key] })
      end

      -- Move keymaps
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        ts_move.goto_next_start("@function.outer")
      end, { desc = "Next function" })
      vim.keymap.set({ "n", "x", "o" }, "]c", function()
        ts_move.goto_next_start("@class.outer")
      end, { desc = "Next class" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        ts_move.goto_previous_start("@function.outer")
      end, { desc = "Previous function" })
      vim.keymap.set({ "n", "x", "o" }, "[c", function()
        ts_move.goto_previous_start("@class.outer")
      end, { desc = "Previous class" })
    end,
  },
}
