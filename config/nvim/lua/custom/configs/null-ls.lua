local null_ls = require("null-ls")
local autoformatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.diagnostics.black,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group=autoformatting_group,
        buffer=bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group=autoformatting_group,
        buffer=bufnr,
        callback = function()
          vim.lsp.buf.format({ buf = bufnr})
        end,
      })
    end
  end,
}
return opts
