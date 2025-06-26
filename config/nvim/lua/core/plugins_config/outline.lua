require('outline').setup({
  outline_window = {
    position = "left",
    auto_close = true,
    width = 30,
  },
})

vim.keymap.set("n", "<leader>s", ":Outline<CR>", {
  desc = "List Symbols",
  noremap = true,
  silent = true,
})
