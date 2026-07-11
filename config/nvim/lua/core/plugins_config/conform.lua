require("conform").setup({
  formatters_by_ft = {
    go   = { "goimports", "gofumpt" },
    gno  = { "gofumpt" },
    rust = { "rustfmt" },
    -- typescript      = { "prettier" },
    -- typescriptreact = { "prettier" },
    -- css  = { "prettier" },
    -- scss = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 7000,
    lsp_fallback = false,
  },
})
