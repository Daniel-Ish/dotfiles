return {
  "stevearc/oil.nvim",
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "-", "<cmd>Oil --float<cr>", desc = "Open parent directory" },
  },
  opts = function()
    local detail = false
    return {
      default_file_explorer = true,
      columns = { "icon" },
      float = {
        padding = 2,
        max_width = 120,
        max_height = 40,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
        ["q"] = "actions.close",
        ["<Esc>"] = "actions.close",
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
    }
  end,
}
