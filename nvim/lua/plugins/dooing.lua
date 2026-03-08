return {
  "atiladefreitas/dooing",
  config = function()
    require("dooing").setup({
      keymaps = {
        toggle_window = "<leader>Td",
        open_project_todo = "<leader>TD",
        show_due_notification = "<leader>TN",
        create_nested_task = "<leader>Tn",
        remove_duplicates = "<leader>TR",
        open_todo_scratchpad = "<leader>Tp",
        share_todos = false,
      },
    })
  end,
}
