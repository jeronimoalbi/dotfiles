local lsp_utils = require("core.lsp-utils")
local on_attach = lsp_utils.on_attach
local capabilities = lsp_utils.make_capabilities()

-- Applied as defaults to every server configured below
vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      usePlaceholders = true,
      analyses = {
        staticcheck = false,
      },
    },
  },
})

-- NOTE: Uncomment to debug the LSP server messages ($HOME/.local/state/nvim/lsp.log)
-- vim.lsp.set_log_level('debug')

vim.lsp.config('gnopls', {
  cmd = { "gnopls", "serve" },
  cmd_env = { GNOROOT = vim.fn.expand('$HOME/Projects/gnolang/gno') },
  filetypes = { "gno" },
  root_markers = { "gnomod.toml" },
  settings = {
    root = vim.fn.expand('$HOME/Projects/gnolang/gno'),
  },
})

vim.lsp.config('ts_ls', {})

vim.lsp.config('lua_ls', {
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
        globals = { 'vim' },
      },
    }
  },
})

vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      schemas = {
        kubernetes = "k8*/**/*.yaml",
      },
    },
  },
})

vim.lsp.enable({ "gopls", "gnopls", "ts_ls", "lua_ls", "yamlls" })
