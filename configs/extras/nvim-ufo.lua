local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ("  %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = false,
}
-- UFO folding
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

require("ufo").setup {
  -- close_fold_kinds = { "imports" },
  fold_virt_text_handler = handler,
  preview = {
    mappings = {
      scrollB = "<C-b>",
      scrollF = "<C-f>",
      scrollU = "<C-u>",
      scrollD = "<C-d>",
    },
  },
  provider_selector = function(_, filetype, buftype)
    local function handleFallbackException(bufnr, err, providerName)
      if type(err) == "string" and err:match "UfoFallbackException" then
        return require("ufo").getFolds(bufnr, providerName)
      else
        return require("promise").reject(err)
      end
    end

    return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
      or function(bufnr)
        return require("ufo")
          .getFolds(bufnr, "lsp")
          :catch(function(err)
            return handleFallbackException(bufnr, err, "treesitter")
          end)
          :catch(function(err)
            return handleFallbackException(bufnr, err, "indent")
          end)
      end
  end,
}

local builtin = require "statuscol.builtin"
require("statuscol").setup {
  relculright = true,
  bt_ignore = { "nofile", "prompt", "terminal", "packer" },
  segments = {
    -- Segment 1: Add padding
    {
      text = { " " },
    },
    -- Segment 2: Fold Column
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    -- Segment 3: Add padding
    {
      text = { " " },
    },
    -- Segment 4: Show signs with one character width
    {
      sign = { name = { ".*" }, maxwidth = 1, colwidth = 1 },
      auto = true,
      click = "v:lua.ScSa",
    },
    -- Segment 5: Show line number
    {
      text = { " ", " ", builtin.lnumfunc, " " },
      click = "v:lua.ScLa",
      condition = { true, builtin.not_empty },
    },
    -- Segment 6: Add padding
    {
      text = { " " },
      hl = "Normal",
      condition = { true, builtin.not_empty },
    },
  },
}
