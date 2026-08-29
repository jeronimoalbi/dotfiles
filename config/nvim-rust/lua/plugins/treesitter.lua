return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "rust", "toml" })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "rust", "toml" },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
