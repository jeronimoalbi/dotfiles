return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>f", function() require("telescope.builtin").find_files() end, desc = "[F]ind files" },
    { "<leader>g", function() require("telescope.builtin").live_grep() end, desc = "Live [g]rep" },
    { "<leader>b", function() require("telescope.builtin").buffers() end, desc = "[B]uffers" },
    { "<leader>d", function() require("telescope.builtin").diagnostics() end, desc = "[D]iagnostics" },
    { "<leader>o", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({})
    pcall(telescope.load_extension, "fzf")
  end,
}
