vim.o.termguicolors = true

local notify = require("notify")

notify.setup({ stages = "fade" })
vim.notify = notify
