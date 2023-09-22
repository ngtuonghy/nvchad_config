local settings = {}
vim.wo.statuscolumn = ""
vim.opt.viewoptions:remove "curdir" -- disable saving current directory with views
vim.opt.shortmess:append { s = true, I = true }
vim.opt.backspace:append { "nostop" }
vim.o.pumheight = 10
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-----------------------------------------------  settings ------------------------------------------------------------
local options = {
  opt = {
    confirm = true,
    relativenumber = true,
    signcolumn = "yes",
    spelllang = "en",
    sidescrolloff = 8, -- Number of columns to keep at the sides of the cursor
    scrolloff = 8, -- Number of lines to keep above and below the cursor
  },
  g = {
    ui_notifications_enabled = true,
    cmp_enabled = true, -- enable completion at start
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    diagnostics_update_in_insert = false, -- diagnostics show in insert mode
  },
}
settings.format_on_save = true --auto format on save
------------------------------------------------------------------------end--------------------------------------------
for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end

-- snipmate format
-- vscode format i.e json files
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets/vscode"

return settings
