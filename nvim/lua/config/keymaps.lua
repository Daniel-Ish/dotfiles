-- Global (non-plugin) keymaps go here
local map = vim.keymap.set

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Stay in visual mode when indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Quick save and quit
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>W", "<cmd>wq!<cr>", { desc = "Save file and quit" })
map("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Force quit" })

-- Wrap-aware j/k (useful for soft-wrapped lines like markdown)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down (wrap-aware)" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up (wrap-aware)" })

-- Diagnostics (Neovim 0.11 maps [d/]d by default, we use the non-deprecated API)
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Session management
map("n", "<leader>sr", function() require("persistence").load() end, { desc = "Restore session (cwd)" })
map("n", "<leader>sl", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
map("n", "<leader>ss", function() require("persistence").select() end, { desc = "Select session" })
map("n", "<leader>sd", function() require("persistence").stop() end, { desc = "Stop session saving" })
