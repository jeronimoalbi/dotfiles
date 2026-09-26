return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("kanagawa").setup({ background = { dark = "dragon", light = "lotus" } })
      vim.cmd.colorscheme("kanagawa")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = { theme = "kanagawa", globalstatus = true },
      sections = { lualine_c = { { "filename", path = 1 } } },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
