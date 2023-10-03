require('symbols-outline').setup({
  position = "left",
  auto_close = true,
  width = 30,
})

vim.keymap.set("n", "<leader>s", ":SymbolsOutline<CR>", {
  desc = "List Symbols",
  noremap = true,
  silent = true,
})
