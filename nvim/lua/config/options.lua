-- Enable absolute line numbers
vim.opt.number = true

-- Enable relative line numbers
vim.opt.relativenumber = true

-- Enable mouse
vim.o.mouse = "a"

-- Scroll fixed bottom
vim.opt.scrolloff = 8

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- UI
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Persistence
vim.opt.undofile = true
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Clipboard
vim.opt.clipboard = "unnamedplus"
