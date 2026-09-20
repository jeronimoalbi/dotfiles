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
