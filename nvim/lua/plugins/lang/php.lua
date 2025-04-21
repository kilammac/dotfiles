return {
  -- Configuration spécifique à PHP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          settings = {
            intelephense = {
              stubs = {
                "bcmath", "bz2", "calendar", "Core", "curl", "date", "dom", "fileinfo",
                "filter", "ftp", "gd", "gettext", "hash", "iconv", "imap", "intl", "json",
                "libxml", "mbstring", "mcrypt", "mysqli", "oci8", "openssl", "pcntl", "pcre",
                "PDO", "pdo_mysql", "Phar", "readline", "recode", "Reflection", "regex",
                "session", "SimpleXML", "soap", "sockets", "sodium", "SPL", "standard",
                "superglobals", "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter",
                "yaml", "zip", "zlib",
              },
              environment = {
                phpVersion = "8.2.0",
              },
            },
          },
        },
      },
    },
  },

  -- Formatage PHP
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer" },
      },
    },
  },
}
