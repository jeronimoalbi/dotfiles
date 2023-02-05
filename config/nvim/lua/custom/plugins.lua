-- Custom plugins installation and setup
return function(use)
  use("haya14busa/is.vim")

  use({
    "rcarriga/nvim-notify",
    config = function()
      local notify = require("notify")

      notify.setup({ stages = "fade" })
      vim.notify = notify
    end,
  })

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    setup = function()
      -- Update global before the plugin is run
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_diagnostics = false,
        window = {
          width = 50,
        },
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
          hijack_netrw_behavior = "open_current",
        },
        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              -- Auto close on select
              require("neo-tree").close_all()
            end
          },
        },
      })
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("NullLsFormatting", {})

      null_ls.setup({
        debug = true,
        log_level = "debug",
        default_timeout = 5000,
        sources = {
          -- Formatters
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.gofumpt,
          null_ls.builtins.formatting.prettier.with({
            filetypes = { "typescript", "typescriptreact", "css", "scss" },
          }),
          -- Linters
          null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.diagnostics.eslint.with({
            filetypes = { "typescript", "typescriptreact", "css", "scss" },
          }),
        },
        on_attach = function(client, bufnr)
          if client.name == "null-ls" and client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            -- Format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false, timeout_ms = 7000, bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  })

  use({
    "debugloop/telescope-undo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- require("telescope").setup({
      --   extensions = {
      --     undo = {
      --       -- telescope-undo.nvim config, see below
      --     },
      --   },
      -- })
      require("telescope").load_extension("undo")
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
  })
end
