local M = {}
M.diagnostics = { [0] = {}, {}, {}, {} }
local extend_tbl = require("custom.utils.helpers").extend_tbl
M.setup_diagnostics = function()
  local default_diagnostics = {
    virtual_text = {
      prefix = "●",
    },
    update_in_insert = vim.g.diagnostics_update_in_insert,
    underline = true,
    signs = true,
    severity_sort = true,
    float = {
      focused = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  M.diagnostics = {
    -- diagnostics off
    [0] = extend_tbl(
      default_diagnostics,
      { underline = false, virtual_text = false, signs = false, update_in_insert = false }
    ),
    -- status only
    extend_tbl(default_diagnostics, { virtual_text = false, signs = false }),
    -- virtual text off, signs on
    extend_tbl(default_diagnostics, { virtual_text = false }),
    -- all diagnostics on
    default_diagnostics,
  }
  vim.diagnostic.config(M.diagnostics[vim.g.diagnostics_mode])
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  title = "Hover",
  width = 60,
  -- height = 30,
})
--
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "none",
  -- width = 60,
  -- height = 30,
})

return M
