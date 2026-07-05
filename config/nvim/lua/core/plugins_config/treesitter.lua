local parsers = {
  "lua", "go", "rust", "vim", "python",
  "typescript", "javascript",
  "yaml", "json", "toml",
  "bash",
  "markdown", "markdown_inline",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua", "go", "rust", "vim", "python",
    "typescript", "javascript",
    "yaml", "json", "toml",
    "sh", "bash",
    "markdown",
    "gno",
  },
  callback = function()
    vim.treesitter.start()
  end,
})

vim.treesitter.language.register("go", "gno")
