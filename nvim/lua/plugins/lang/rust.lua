return {
  -- Configuration pour Rust
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              procMacro = {
                enable = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
                typeHints = { enable = true },
                parameterHints = { enable = true },
                reborrowHints = { enable = true },
              },
            },
          },
        },
      },
    },
  },

  -- Outils supplémentaires pour Rust
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = { "rust" },
    opts = function()
      return {
        tools = {
          inlay_hints = {
            auto = true,
          },
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            -- Raccourcis spécifiques à Rust
            vim.keymap.set("n", "<leader>rr", "<cmd>RustRunnables<CR>", { buffer = bufnr, desc = "Rust Runnables" })
            vim.keymap.set("n", "<leader>rd", "<cmd>RustDebuggables<CR>", { buffer = bufnr, desc = "Rust Debuggables" })
            vim.keymap.set("n", "<leader>re", "<cmd>RustExpandMacro<CR>", { buffer = bufnr, desc = "Expand Macro" })
          end,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
  },

  -- Cargo.toml assistance
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup({
        popup = {
          border = "rounded",
        },
      })
    end,
  },
}                
