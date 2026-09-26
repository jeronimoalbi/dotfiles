return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  ft = "rust",
  init = function()
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
            cargo = { allFeatures = true },
            procMacro = { enable = true },
          },
        },
        on_attach = function(_, bufnr)
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = "Rust: " .. desc })
          end
          map("K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Hover actions")
          map("<leader>a", function() vim.cmd.RustLsp("codeAction") end, "Code [A]ction")
          map("<leader>rr", function() vim.cmd.RustLsp("runnables") end, "[R]unnables")
          map("<leader>rt", function() vim.cmd.RustLsp("testables") end, "[T]estables")
          map("<leader>rd", function() vim.cmd.RustLsp("debuggables") end, "[D]ebuggables")
          map("<leader>rm", function() vim.cmd.RustLsp("expandMacro") end, "Expand [M]acro")
          map("<leader>rc", function() vim.cmd.RustLsp("openCargo") end, "Open [C]argo.toml")
          map("<leader>rp", function() vim.cmd.RustLsp("parentModule") end, "[P]arent module")
        end,
      },
      tools = {
        inlay_hints = { auto = true },
      },
    }
  end,
}
