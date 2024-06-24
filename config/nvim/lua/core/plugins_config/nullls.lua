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
    require("none-ls.formatting.rustfmt").with({
        extra_args = function(params)
            local Path = require("plenary.path")
            local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

            if cargo_toml:exists() and cargo_toml:is_file() then
                for _, line in ipairs(cargo_toml:readlines()) do
                    local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                    if edition then
                        return { "--edition=" .. edition }
                    end
                end
            end
            -- default edition when we don't find `Cargo.toml` or the `edition` in it.
            return { "--edition=2021" }
        end,
    }),
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "typescript", "typescriptreact", "css", "scss" },
    }),
    -- Linters
    null_ls.builtins.diagnostics.golangci_lint,
    require("none-ls.diagnostics.eslint").with({
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
