-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Autocmd pour définir automatiquement les largeurs d'indentation par langage
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local indent_group = augroup("IndentConfig", { clear = true })
autocmd("FileType", {
  group = indent_group,
  pattern = { "php", "html", "css", "xml" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Autoformat on save (si souhaité)
local format_group = augroup("AutoFormat", { clear = true })
autocmd("BufWritePre", {
  group = format_group,
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.go", "*.rs", "*.php" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Activation de la complétion automatique par langage
local completion_group = augroup("CompletionConfig", { clear = true })
autocmd("FileType", {
  group = completion_group,
  pattern = { "javascript", "typescript", "php", "c", "cpp", "go", "rust" },
  callback = function()
    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
  end,
})
