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
  formatters = {
    rustfmt = {
      prepend_args = function(_, ctx)
        local cargo = ctx.dirname .. "/Cargo.toml"
        if vim.fn.filereadable(cargo) == 1 then
          for _, line in ipairs(vim.fn.readfile(cargo)) do
            local edition = line:match('^edition%s*=%s*"(%d+)"')
            if edition then return { "--edition=" .. edition } end
          end
        end
        return { "--edition=2021" }
      end,
    },
  },
  format_on_save = {
    timeout_ms = 7000,
    lsp_fallback = false,
  },
})
