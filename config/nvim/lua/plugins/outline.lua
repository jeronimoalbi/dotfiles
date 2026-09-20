return {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>s", "<cmd>Outline<CR>", desc = "List [S]ymbols", silent = true },
  },
  opts = {
    outline_window = {
      position = "left",
      auto_close = true,
      width = 30,
    },
  },
}
