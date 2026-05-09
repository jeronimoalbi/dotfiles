local lsp_utils = require("core.lsp-utils")
local on_attach = lsp_utils.on_attach
local capabilities = lsp_utils.make_capabilities()

local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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

require('lspconfig.configs').gnopls = {
  default_config = {
    name = 'gnopls',
    filetypes = { "gno" },
    cmd = { "gnopls", "serve" },
    cmd_env = { GNOROOT = vim.fn.expand('$HOME/Projects/gnolang/gno') },
    root_dir = vim.fn.expand('%:p:h'),
    settings = {
      root = vim.fn.expand('$HOME/Projects/gnolang/gno'),
    },
  };
}
lspconfig.gnopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "gno" },
  root_dir = util.root_pattern("gnomod.toml"),
})

lspconfig.ts_ls.setup({
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
      },
      diagnostics = {
        globals = { 'vim' },
      },
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
