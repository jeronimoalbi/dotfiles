-- Gruvbox
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[ colorscheme gruvbox ]])

-- Onedark
-- require('onedark').setup({ style = 'darker' })
-- require('onedark').load()

-- Kanagawa
-- iTerm: https://raw.githubusercontent.com/rebelot/kanagawa.nvim/master/extras/kanagawa.itermcolors
require('kanagawa').setup({
    background = {
        dark = "dragon",
        -- dark = "wave",
        light = "lotus"
    },
})
vim.cmd('colorscheme kanagawa')
