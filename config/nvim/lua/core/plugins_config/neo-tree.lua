require("neo-tree").setup({
  close_if_last_window = true,
  enable_diagnostics = false,
  window = {
    width = 50,
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
    hijack_netrw_behavior = "open_current",
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function()
        -- require("neo-tree").close_all()
        require("neo-tree.command").execute({ action = "close" })
      end
    },
  }
})

vim.keymap.set('n', '<leader>o', ':Neotree toggle<CR>', { silent = true })
