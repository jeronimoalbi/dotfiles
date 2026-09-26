return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      gno = { "gofumpt" },
      rust = { "rustfmt", lsp_format = "fallback" },
    },
    format_on_save = { timeout_ms = 5000, lsp_format = "fallback" },
  },
}
