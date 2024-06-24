require("neodev").setup()

-- It is also possible to attach when LSP server attaches to chrrent buffer
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration
local on_attach = function(client, bufnr)
  -- Helper function to define key mappings
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- Let null-ls handle formatting
  client.server_capabilities["documentFormattingProvider"] = false
  client.server_capabilities["documentRangeFormattingProvider"] = false

  -- Define key mappings
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Extend capabilities with "nvim-cmp" capabilities
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      usePlaceholders = true,
    },
  },
})

-- -- NOTE: Don't uncomment
-- -- Leaving this one just in case is useful
-- vim.tbl_deep_extend('keep', lspconfig, {
-- 	gnopls = {
-- 		name = 'gnopls',
--              filetypes = { "gno", "gnomod" },
-- 		cmd = { "gnopls", "serve", "--gnoroot", vim.fn.expand('$HOME/Projects/gnolang/gno') },
-- 	}
-- })

-- NOTE: Configure gnopls (no need to run vim.lsp.start with these settings)
-- require('lspconfig.configs').gnopls = {
--   default_config = {
--     name = 'gnopls',
--     filetypes = { "gno", "gnomod" },
--     cmd = { "gnopls", "serve", "--gnoroot", vim.fn.expand('$HOME/Projects/gnolang/gno') },
--     settings = {},
--   };
-- }
-- lspconfig.gnopls.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { "gno", "gnomod" },
--   root_dir = util.root_pattern("gno.mod"),
-- })

-- NOTE: The gnols dies on initialize
-- -- vim.lsp.set_log_level('debug')
-- require('lspconfig.configs').gnols = {
--   default_config = {
-- 		name = 'gnols',
--     filetypes = { "gno", "gnomod" },
-- 		cmd = { "gnols" },
--     settings = {
--       root = vim.fn.expand('$HOME/Projects/gnolang/gno'),
--     },
--   };
-- }
-- lspconfig.gnols.setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { "gno", "gnomod" },
--   root_dir = util.root_pattern("gno.mod"),
--   -- root_dir = vim.fn.expand('$HOME/Projects/gnolang/gno'),
-- })

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})


lspconfig.lua_ls.setup({
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
      }
    }
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        kubernetes = "k8*/**/*.yaml",
      },
    },
  },
  capabilities = capabilities,
})

-- lspconfig.rust_analyzer.setup({
--   on_attach = function (_, bufnr)
--     vim.api.nvim_create_augroup("rust-analyzer", { clear = true })
--     vim.api.nvim_clear_autocmds({ group = "rust-analyzer", buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = "rust-analyzer",
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format({ bufnr = bufnr })
--       end,
--     })
--   end
-- })

-- Use rust-tools to handle Rust LSP configuration
local rust_tools = require("rust-tools")
rust_tools.setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
  tools = {
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      auto = true,
      only_current_line = true,
      show_parameter_hints = true,
    },
  },
})
