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
  -- Notifications (eager — overrides vim.notify before anything else loads)
  { "rcarriga/nvim-notify", lazy = false },

  -- Focus modes
  { "folke/zen-mode.nvim", cmd = "ZenMode", opts = {} },
  { "folke/twilight.nvim", cmd = "Twilight", opts = {} },

  -- Colorschemes
  { "rebelot/kanagawa.nvim", priority = 1000, lazy = false },
  { "ellisonleao/gruvbox.nvim", priority = 1000, lazy = true, config = false },
  { "navarasu/onedark.nvim", lazy = true },

  -- Icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Syntax / parsing
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable 'make' == 1 },
      { "debugloop/telescope-undo.nvim" },
    },
  },

  -- LSP toolchain
  { "williamboman/mason.nvim", event = "VeryLazy" },
  { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
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

  -- Formatting (replaces none-ls)
  { "stevearc/conform.nvim", event = "BufWritePre" },

  -- Linting (replaces none-ls)
  { "mfussenegger/nvim-lint", event = { "BufReadPost", "BufWritePost" } },

  -- Session management
  { "rmagatti/auto-session", lazy = false },

  -- Rust (replaces rust-tools.nvim)
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
  },

  -- Rust crates.io integration
  {
    'saecki/crates.nvim',
    version = "*",
    ft = "toml",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },

  -- LSP progress UI
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },

  -- Auto-detect indentation
  { "tpope/vim-sleuth", event = "BufReadPost" },

  -- Neovim API completion (replaces neodev.nvim)
  { "folke/lazydev.nvim", ft = "lua", opts = {} },

  -- Git
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim", event = "BufReadPost" },

  -- Visual helpers
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", event = "BufReadPost" },
  { "wellle/context.vim", event = "BufReadPost" },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require('Comment').setup()
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
      "hrsh7th/nvim-cmp",
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
    dependencies = { 'godlygeek/tabular' },
  },

  -- Language syntax
  { "HerringtonDarkholme/yats.vim", ft = "typescript" },
  { "geseq/tengo-vim", event = "VeryLazy" },

  -- Symbol outline
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
  },
}

-- Plugin manager options
local options = {}

require("lazy").setup(plugins, options)
