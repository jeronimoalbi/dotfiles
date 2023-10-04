require("ibl").setup({
  scope = {
    show_start = false,
    show_end = false,
  },
})

local hooks = require("ibl.hooks")

-- Change indent-blankline.nvim to avoid 1st level indent guide
hooks.register(
  hooks.type.WHITESPACE,
  hooks.builtin.hide_first_space_indent_level
)
hooks.register(
  hooks.type.WHITESPACE,
  hooks.builtin.hide_first_tab_indent_level
)
