require('gitsigns').setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Hunk navigation (falls back to built-in ]c/[c in diff mode)
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(gs.next_hunk)
      return '<Ignore>'
    end, 'Next hunk')

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(gs.prev_hunk)
      return '<Ignore>'
    end, 'Prev hunk')

    -- Hunk actions
    map('n', '<leader>hs', gs.stage_hunk,        'Stage hunk')
    map('n', '<leader>hr', gs.reset_hunk,        'Reset hunk')
    map('n', '<leader>hu', gs.undo_stage_hunk,   'Undo stage hunk')
    map('n', '<leader>hp', gs.preview_hunk,      'Preview hunk')
    map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Blame line')
  end,
})
