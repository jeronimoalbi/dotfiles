vim.keymap.set('n', 'p', ':put<CR>', { silent = true, desc = 'Paste on newline below' })
vim.keymap.set('n', 'P', ':put!<CR>', { silent = true, desc = '[P]aste on newline above' })
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Jump to the prev/next diagnostic and open its float
local function jump_diagnostic(count)
  return function()
    vim.diagnostic.jump({
      count = count,
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
      end,
    })
  end
end
vim.keymap.set("n", "[d", jump_diagnostic(-1), { desc = "Previous [d]iagnostic" })
vim.keymap.set("n", "]d", jump_diagnostic(1), { desc = "Next [d]iagnostic" })

vim.keymap.set("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "[T]oggle inlay [h]ints" })
