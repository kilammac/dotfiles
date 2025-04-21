-- Installation et configuration de lazy.nvim

vim.g.maplocalleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configuration des plugins
require("lazy").setup({
  spec = {
    -- Plugins de base de LazyVim
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- Liste des plugins importés par catégorie
    { import = "plugins.core" },
    { import = "plugins.coding" },
    { import = "plugins.colorscheme" },
    { import = "plugins.editor" },
    { import = "plugins.lsp" },
    { import = "plugins.treesitter" },
    { import = "plugins.ui" },

    -- Import des plugins par langage
    { import = "plugins.lang.javascript" },
    { import = "plugins.lang.typescript" },
    { import = "plugins.lang.php" },
    { import = "plugins.lang.c" },
    { import = "plugins.lang.go" },
    { import = "plugins.lang.rust" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight", "catppuccin" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
