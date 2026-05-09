local lint = require("lint")

lint.linters_by_ft = {
  go              = { "golangcilint" },
  typescript      = { "eslint" },
  typescriptreact = { "eslint" },
  css             = { "eslint" },
  scss            = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    lint.try_lint()
  end,
})
