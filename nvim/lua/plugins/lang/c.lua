return {
  -- Configuration pour C/C++
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
          },
        },
      },
    },
  },

  -- Outils supplémentaires pour C/C++
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
    opts = {
      inlay_hints = {
        inline = true,
      },
      ast = {
        role_icons = {
          type = "🄣",
          declaration = "🄓",
          expression = "🄔",
          statement = "🄢",
          -- ... autres rôles
        },
        kind_icons = {
          Compound = "🄲",
          Recovery = "🅁",
          TranslationUnit = "🅄",
          PackExpansion = "🄿",
          -- ... autres types
        },
      },
    },
  },

  -- Debugger pour C/C++
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
          args = { "--port", "${port}" },
        },
      }
      
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      
      dap.configurations.c = dap.configurations.cpp
    end,
  },
}
