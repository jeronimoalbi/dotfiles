-- Setup neovim session options for better auto-session experience
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require("auto-session").setup({
  auto_save = false,
  auto_create = false,
  git_use_branch_name = true,
  allowed_dirs = { "~/Projects", },
  session_lens = {
    picker = "telescope",
    buftypes_to_ignore = {}, 
    load_on_setup = true,
    theme_conf = { border = true },
    previewer = false,
  },
})

vim.keymap.set('n', '<leader>a', ':AutoSession search<CR>', { silent = true })
