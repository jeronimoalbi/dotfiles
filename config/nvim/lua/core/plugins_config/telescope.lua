require("telescope").setup()
require("telescope").load_extension("fzf")
require("telescope").load_extension("undo")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>b", builtin.buffers, {
  desc = "List Buffers",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {
  desc = "Fuzzy Find Buffer",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>d", builtin.oldfiles, {
  desc = "Find Files (History)",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>f", builtin.find_files, {
  desc = "Find Files",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>g", builtin.git_files, {
  desc = "Find Files (Git)",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>f", builtin.live_grep, {
  desc = "Live Grep",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>x", builtin.lsp_document_symbols, {
  desc = "List Document Symbols",
  noremap = true,
  silent = true,
})
-- vim.keymap.set("n", "<leader>s", builtin.lsp_dynamic_workspace_symbols, {
--   desc = "Search Workspace Symbols",
--   noremap = true,
--   silent = true,
-- })

vim.keymap.set("n", "<leader>u", ":Telescope undo<CR>", { silent = true })
