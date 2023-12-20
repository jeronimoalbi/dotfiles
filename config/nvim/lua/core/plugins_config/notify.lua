vim.o.termguicolors = true

local notify = require("notify")

notify.setup({
  stages = "fade",
  background_colour = "#000000",
})
vim.notify = notify
