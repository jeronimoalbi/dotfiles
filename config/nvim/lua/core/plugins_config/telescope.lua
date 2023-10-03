require("telescope").setup()
require("telescope").load_extension("fzf")
require("telescope").load_extension("undo")

vim.keymap.set("n", "<leader>u", ":Telescope undo<CR>", { silent = true })

-- local builtin = require("telescope.builtin")
-- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
