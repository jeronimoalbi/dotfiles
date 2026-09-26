return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "lua", "go", "rust", "vim", "python",
      "typescript", "javascript",
      "yaml", "json", "toml",
      "bash",
      "markdown", "markdown_inline",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua", "go", "rust", "vim", "python",
        "typescript", "javascript",
        "yaml", "json", "toml",
        "sh", "bash",
        "markdown",
        "gno",
      },
      callback = function() vim.treesitter.start() end,
    })

    -- Gno is Go with a different extension
    vim.treesitter.language.register("go", "gno")
  end,
}
