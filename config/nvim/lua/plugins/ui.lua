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
  -- Alternative colorschemes (unused, lazy)
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },

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
    opts = {
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Hunk navigation (falls back to built-in ]c/[c in diff mode)
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.nav_hunk("next") end)
          return "<Ignore>"
        end, "Next hunk")

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.nav_hunk("prev") end)
          return "<Ignore>"
        end, "Prev hunk")

        -- Hunk actions (<leader>H so <leader>h stays an instant :nohlsearch)
        map("n", "<leader>Hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>Hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>Hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>Hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>Hb", function() gs.blame_line({ full = true }) end, "Blame line")
      end,
    },
  },

  -- Notifications (eager: overrides vim.notify before anything else loads)
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "fade",
        background_colour = "#000000",
      })
      vim.notify = notify
    end,
  },

  -- LSP progress UI
  { "j-hui/fidget.nvim", event = "LspAttach", opts = {} },

  -- Indent guides (hide the 1st level)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPost",
    config = function()
      require("ibl").setup({
        scope = {
          show_start = false,
          show_end = false,
        },
      })

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
    end,
  },

  { "wellle/context.vim", event = "BufReadPost" },
}
