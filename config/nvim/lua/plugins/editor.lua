-- Generic editing helpers and language extras (not part of the Rust config)
return {
  -- Focus modes
  { "folke/zen-mode.nvim", cmd = "ZenMode", opts = {} },
  { "folke/twilight.nvim", cmd = "Twilight", opts = {} },

  -- Auto-detect indentation
  { "tpope/vim-sleuth", event = "BufReadPost" },

  -- Neovim API completion (replaces neodev.nvim)
  { "folke/lazydev.nvim", ft = "lua", opts = {} },

  -- Git
  { "tpope/vim-fugitive", event = "VeryLazy" },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Notes
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand "~" .. "Documents/Obsidian/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "Documents/Obsidian/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      preferred_link_style = "wiki",
      workspaces = {
        {
          name = "work",
          path = "~/Documents/Obsidian/Notes",
        },
      },
      picker = {
        name = "telescope.nvim",
        mappings = {
          new = "<C-x>",
          insert_link = "<C-l>",
        },
      },
    },
  },

  -- Markdown
  {
    "preservim/vim-markdown",
    ft = { "markdown" },
    dependencies = { "godlygeek/tabular" },
  },

  -- Language syntax
  { "HerringtonDarkholme/yats.vim", ft = "typescript" },
  { "geseq/tengo-vim", event = "VeryLazy" },
}
