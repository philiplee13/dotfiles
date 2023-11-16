local null_ls = require("null-ls")
local autoformatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local opts = {
  sources = {
    formatting.black,
    diagnostics.mypy,
    diagnostics.ruff,
    formatting.yamlfix,
    formatting.yamlfmt,
    diagnostics.tflint,
    diagnostics.yamllint
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
