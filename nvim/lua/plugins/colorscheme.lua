return {
  -- Thème moderne adapté à Hyprland
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true, -- Bon pour Hyprland
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  
  -- Alternative: TokyoNight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
    },
  },
}
