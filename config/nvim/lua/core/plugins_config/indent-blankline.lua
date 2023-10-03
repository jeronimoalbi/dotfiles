-- Change indent-blankline.nvim to avoid 1st level indent guide
vim.g.indent_blankline_show_first_indent_level = false

require("ibl").setup({
  scope = {
    show_start = false,
    show_end = false,
  },
})
