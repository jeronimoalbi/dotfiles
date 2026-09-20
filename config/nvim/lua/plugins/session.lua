return {
  "rmagatti/auto-session",
  lazy = false,
  init = function()
    -- Session options for a better auto-session experience
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
  end,
  keys = {
    { "<leader>S", "<cmd>AutoSession search<CR>", desc = "[S]essions", silent = true },
  },
  opts = {
    auto_save = false,
    auto_create = false,
    git_use_branch_name = true,
    allowed_dirs = { "~/Projects" },
    session_lens = {
      picker = "telescope",
      buftypes_to_ignore = {},
      load_on_setup = true,
      theme_conf = { border = true },
      previewer = false,
    },
  },
}
