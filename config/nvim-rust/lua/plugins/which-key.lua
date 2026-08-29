return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>r", group = "Rust" },
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
