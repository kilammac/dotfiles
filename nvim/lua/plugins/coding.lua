return {
  -- Commentaires rapides
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },

  -- Auto-paires pour les crochets, parenthèses, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
    },
  },

  -- Déboguer avec DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed = { "node2", "php", "codelldb", "delve", "python" },
        automatic_installation = true,
      })

      -- Configuration du débogueur JavaScript
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
      }
      
      -- Configuration des adaptateurs pour chaque langage ici
      -- ...

      -- UI du débogueur
      dapui.setup()
      
      -- Ouverture automatique du UI lors du démarrage du débogage
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    end,
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    },
  },

  -- Gestionnaire Git intégré
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  -- Recherche avancée
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },
}
