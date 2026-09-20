return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>r", group = "Rust" },
      { "<leader>H", group = "Git hunks" },
      { "<leader>t", group = "Toggle" },
      { "<leader>c", group = "Code" },
      { "<leader>w", group = "Workspace" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show() end,
      desc = "Show all keymaps (which-key)",
    },
  },
}
