-- Prepare plugins manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- List of installed plugins
local plugins = {
  { "rcarriga/nvim-notify", lazy = false },
  { "folke/zen-mode.nvim", opts = { } },
  { "folke/twilight.nvim", opts = { } },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = false },
  { "rebelot/kanagawa.nvim" },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    config = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      -- Only load if make is available
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable 'make' == 1 },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-vsnip",
          "hrsh7th/vim-vsnip",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-path",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-cmdline",
        },
      }
    },
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      { "nvimtools/none-ls-extras.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "neovim/nvim-lspconfig" },
    },
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
    },
  },
  {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = function()
      require('fidget').setup()
    end,
  },
  { "tpope/vim-sleuth" },
  { "folke/neodev.nvim" },
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
  { "wellle/context.vim" },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require('Comment').setup()
    end,
  },
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
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Either 'wiki' or 'markdown'
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
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
      },
    },
  },
  {
    "preservim/vim-markdown",
    dependencies = { 'godlygeek/tabular' },
  },
  { "HerringtonDarkholme/yats.vim", ft = "typescript" },
  { "navarasu/onedark.nvim" },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
  },
  { "geseq/tengo-vim" },
}

-- Plugin manager options
local options = {}

require("lazy").setup(plugins, options)
