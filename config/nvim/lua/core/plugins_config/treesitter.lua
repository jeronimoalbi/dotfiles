require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "go",
    "rust",
    "vim",
    "python",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})

vim.treesitter.language.register('go', 'gno')
