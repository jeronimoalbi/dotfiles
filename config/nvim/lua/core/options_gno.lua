--
-- Enable Gno syntax and formatting
--

vim.api.nvim_create_augroup("gno", { clear = true })

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "gno",
  pattern = "*.gno",
  callback = function ()
    vim.opt_local.filetype = "gno"
    -- NOTE: Right now LSP is started using lspconfig otherwise it could be started here
    -- vim.lsp.start({
    --   name = "gnopls",
    --   cmd = { "gnopls", "serve", "--gnoroot", vim.fn.expand('$HOME/Projects/gnolang/gno') },
    --   root_dir = vim.fn.expand('%:p:h'),
    -- })
  end
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = "gno",
  pattern = "*.gno",
  callback = function(args)
    local job = require('plenary.job')

    -- Format code and refresh the buffer
    job:new({
      command = "gofumpt",
      args = { "-w", args.file },
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.schedule(function()
            vim.cmd.checktime(args.buf)
          end)
        else
          vim.notify("Error running gofumpt", vim.log.levels.ERROR, {
            title = "Code Formatting",
          })
        end
      end,
    }):start()

    -- NOTE: Linting is being done by the LSP server right now
    -- local async = require('plenary.async')
    --
    -- Run the Gno linter
    -- async.run(function()
    --   local ns = vim.api.nvim_create_namespace('gno-lint')
    --   local lines = vim.fn.systemlist({ "gno", "lint", args.file })
    --   if #lines > 0 then
    --     -- Show linting errors
    --     local diagnostics = vim.fn.getqflist({ lines = lines })
    --     vim.diagnostic.set(ns, args.buf, vim.diagnostic.fromqflist(diagnostics.items))
    --   else
    --     -- Remove previous lint errors when linting succeeds
    --     if #vim.diagnostic.get(args.buf) > 0 then
    --       vim.diagnostic.reset(ns, args.buf)
    --     end
    --   end
    -- end)
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
