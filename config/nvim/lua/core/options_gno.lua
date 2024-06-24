--
-- Enable Gno syntax and formatting
--

vim.api.nvim_create_augroup("gno", { clear = true })

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "gno",
  pattern = "*.gno",
  callback = function ()
    -- vim.cmd("set filetype=go")
    vim.cmd("set filetype=gno")

    -- vim.lsp.start({
    --   name = "gnopls",
    --   cmd = { "gnopls", "serve", "--gnoroot", vim.fn.expand('$HOME/Projects/gnolang/gno') },
    --   root_dir = vim.fn.expand('%:p:h'),
    -- })

    -- vim.lsp.start({
    --   name = "gnols",
    --   cmd = { "gnols" },
    --   root_dir = vim.fn.expand('$HOME/Projects/gnolang/gno'),
    -- })
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = "gno",
  pattern = "*.gno",
  callback = function(args)
    -- Format code and refresh the buffer
    vim.system({ "gofumpt", "-w", args.file }, nil, function (o)
      -- if o.code == 0 then
      --   vim.cmd.checktime(args.buf)
      -- end
    end)

    -- Run the Gno linter
    local ns = vim.api.nvim_create_namespace('gno-lint')
    local lines = vim.fn.systemlist({ "gno", "lint", args.file })
    if #lines > 0 then
      -- Show linting errors
      local diagnostics = vim.fn.getqflist({ lines = lines })
      vim.diagnostic.set(ns, args.buf, vim.diagnostic.fromqflist(diagnostics.items))
    else
      -- Remove previous lint errors when linting succeeds
      if #vim.diagnostic.get(args.buf) > 0 then
        vim.diagnostic.reset(ns, args.buf)
      end
    end
  end,
})

vim.api.nvim_create_augroup("gnotmpl", { clear = true })

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "gnotmpl",
  pattern = "*.gnt",
  callback = function ()
    vim.cmd("set syntax=gnotmpl")
  end
})
