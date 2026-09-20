return {
  { "williamboman/mason.nvim", event = "VeryLazy" },
  { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "ts_ls",
        },
        -- rustaceanvim owns the rust-analyzer LSP client lifecycle; without this
        -- exclusion mason-lspconfig's automatic_enable also starts a second,
        -- competing rust_analyzer client, causing duplicate completion items.
        automatic_enable = {
          exclude = { "rust_analyzer" },
        },
        handlers = {
          -- Prevent golangci_lint_ls from auto-starting; nvim-lint handles golangci-lint
          golangci_lint_ls = function() end,
        },
      })

      -- Keymaps are attached in lua/lsp.lua (LspAttach); capabilities use nvim's defaults

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            usePlaceholders = true,
            analyses = {
              staticcheck = false,
            },
            -- Shown once inlay hints are toggled on (<leader>th)
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })

      -- NOTE: Uncomment to debug the LSP server messages ($HOME/.local/state/nvim/lsp.log)
      -- vim.lsp.set_log_level('debug')

      vim.lsp.config("gnopls", {
        cmd = { "gnopls", "serve" },
        cmd_env = { GNOROOT = vim.fn.expand("$HOME/Projects/gnolang/gno") },
        filetypes = { "gno" },
        root_markers = { "gnomod.toml" },
        settings = {
          root = vim.fn.expand("$HOME/Projects/gnolang/gno"),
        },
      })

      vim.lsp.config("ts_ls", {})

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemas = {
              kubernetes = "k8*/**/*.yaml",
            },
          },
        },
      })

      vim.lsp.enable({ "gopls", "gnopls", "ts_ls", "lua_ls", "yamlls" })
    end,
  },
}
