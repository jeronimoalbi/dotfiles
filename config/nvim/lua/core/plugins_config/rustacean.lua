local lsp_utils = require("core.lsp-utils")

vim.g.rustaceanvim = {
  server = {
    on_attach = lsp_utils.on_attach,
    capabilities = lsp_utils.make_capabilities(),
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = { command = "clippy" },
      },
    },
  },
  tools = {
    inlay_hints = {
      auto = true,
      only_current_line = true,
    },
  },
}
