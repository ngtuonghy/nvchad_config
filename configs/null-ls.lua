-- require "cusom.configs.format"
local null_ls = require "null-ls"
local mason_null_ls = require "mason-null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
--
local sources = {
  --  webdev stuff
  format.deno_fmt,
  -- b.formatting.prettier,
  format.prettier.with { filetypes = { "html", "markdown", "css", "javascript" } },
  -- Lua
  format.stylua,
  -- Shell
  format.shfmt,

  lint.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
  -- cpp
  format.clang_format,
}

mason_null_ls.setup {
  ensure_installed = { "stylua", "clang_format", "shfmt", "prettier" },
  handlers = {},
}

-- Hàm để thực hiện định dạng
local function format_buffer()
  format = require "custom.options"
  local autoformat_enabled = vim.b.autoformat_enabled
  if autoformat_enabled == nil then
    autoformat_enabled = vim.g.autoformat_enabled
  end
  if autoformat_enabled and format.format_on_save then
    vim.lsp.buf.format {} -- Thực hiện định dạng
  end
end

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup, -- Đặt tên nhóm autocmd
        buffer = bufnr,
        callback = format_buffer, -- Gọi hàm thực hiện định dạng
      })
    end
  end,
}
