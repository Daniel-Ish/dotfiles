vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.conceallevel = 2
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Python filetype settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "120"
  end,
})

-- Auto-activate venv in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local cwd = vim.fn.getcwd()
    for _, dir in ipairs({ "venv", ".venv" }) do
      local activate = cwd .. "/" .. dir .. "/bin/activate"
      if vim.fn.filereadable(activate) == 1 then
        vim.defer_fn(function()
          local chan = vim.b.terminal_job_id
          if chan then
            vim.api.nvim_chan_send(chan, "source " .. activate .. " && clear\n")
          end
        end, 100)
        return
      end
    end
  end,
})
