-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Configuration des raccourcis clavier personnalisés
local map = vim.keymap.set

-- Leader key
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Navigation entre les fenêtres
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Manipulation des buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Recherche et remplacement améliorés
map(
  "n",
  "<leader>fr",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Find and replace word under cursor" }
)

-- Commandes de développement rapides
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format code" })

-- Raccourcis personnalisés pour le débogage et l'exécution
map("n", "<leader>dr", "<cmd>lua require('dap').continue()<CR>", { desc = "Start or continue debugging" })
map("n", "<leader>dt", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
