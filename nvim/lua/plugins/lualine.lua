return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons", "catppuccin" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin-mocha",
        globalstatus = true,
      },
      sections = {
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diff" },
        lualine_y = { "location" },
        lualine_z = {
          { function() return vim.fn.nr2char(0xF017, true) .. " " .. os.date("%H:%M") end },
        },
      },
    })
  end,
}
