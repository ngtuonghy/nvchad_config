local M = {}
Notify = require("custom.utils.helpers").notify

local function bool2str(bool)
  return bool and "on" or "off"
end

function M.toggle_ui_notifications()
  vim.g.ui_notifications_enabled = not vim.g.ui_notifications_enabled
  Notify(string.format("Notifications %s", bool2str(vim.g.ui_notifications_enabled)))
end

function M.toggle_autopairs()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if ok then
    if autopairs.state.disabled then
      autopairs.enable()
    else
      autopairs.disable()
    end
    vim.g.autopairs_enabled = autopairs.state.disabled
    Notify(string.format("autopairs %s", bool2str(not autopairs.state.disabled)))
  else
    Notify "autopairs not available"
  end
end

function M.toggle_cmp()
  vim.g.cmp_enabled = not vim.g.cmp_enabled
  local ok, _ = pcall(require, "cmp")
  Notify(ok and string.format("completion %s", bool2str(vim.g.cmp_enabled)) or "completion not available")
end

--- Toggle auto format
function M.toggle_autoformat()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  Notify(string.format("Global autoformatting %s", bool2str(vim.g.autoformat_enabled)))
end

-- Toggle buffer local auto format
function M.toggle_buffer_autoformat()
  local old_val = vim.b.autoformat_enabled
  if old_val == nil then
    old_val = vim.g.autoformat_enabled
  end
  vim.b.autoformat_enabled = not old_val
  Notify(string.format("Buffer autoformatting %s", bool2str(vim.b.autoformat_enabled)))
end
-- print(vim.g.autoformat_enabled)
-- print(vim.b.autoformat_enabled)

--- Toggle wrap
function M.toggle_wrap()
  vim.wo.wrap = not vim.wo.wrap -- local to window
  Notify(string.format("wrap %s", bool2str(vim.wo.wrap)))
end

function M.toggle_spell()
  vim.wo.spell = not vim.wo.spell -- local to window
  Notify(string.format("spell %s", bool2str(vim.wo.spell)))
end

--- Change the number display modes
function M.change_number()
  local number = vim.wo.number -- local to window
  local relativenumber = vim.wo.relativenumber -- local to window
  if not number and not relativenumber then
    vim.wo.number = true
  elseif number and not relativenumber then
    vim.wo.relativenumber = true
  elseif number and relativenumber then
    vim.wo.number = false
  else -- not number and relativenumber
    vim.wo.relativenumber = false
  end
  Notify(string.format("number %s, relativenumber %s", bool2str(vim.wo.number), bool2str(vim.wo.relativenumber)))
end

--- Toggle syntax highlighting and treesitter
function M.toggle_syntax()
  local ts_avail, parsers = pcall(require, "nvim-treesitter.parsers")
  if vim.g.syntax_on then -- global var for on//off
    if ts_avail and parsers.has_parser() then
      vim.cmd.TSBufDisable "highlight"
    end
    vim.cmd.syntax "off" -- set vim.g.syntax_on = false
  else
    if ts_avail and parsers.has_parser() then
      vim.cmd.TSBufEnable "highlight"
    end
    vim.cmd.syntax "on" -- set vim.g.syntax_on = true
  end
  Notify(string.format("syntax %s", bool2str(vim.g.syntax_on)))
end

local last_active_foldcolumn
--- Toggle foldcolumn=0|1
function M.toggle_foldcolumn()
  local curr_foldcolumn = vim.wo.foldcolumn
  if curr_foldcolumn ~= "0" then
    last_active_foldcolumn = curr_foldcolumn
  end
  vim.wo.foldcolumn = curr_foldcolumn == "0" and (last_active_foldcolumn or "1") or "0"
  Notify(string.format("foldcolumn=%s", vim.wo.foldcolumn))
end

--- Toggle signcolumn="auto"|"no"
function M.toggle_signcolumn()
  if vim.wo.signcolumn == "no" then
    vim.wo.signcolumn = "yes"
  elseif vim.wo.signcolumn == "yes" then
    vim.wo.signcolumn = "auto"
  else
    vim.wo.signcolumn = "no"
  end
  Notify(string.format("signcolumn=%s", vim.wo.signcolumn))
end

--- Toggle laststatus=3|2|0
function M.toggle_statusline()
  local laststatus = vim.opt.laststatus:get()
  local status
  if laststatus == 0 then
    vim.opt.laststatus = 2
    status = "local"
  elseif laststatus == 2 then
    vim.opt.laststatus = 3
    status = "global"
  elseif laststatus == 3 then
    vim.opt.laststatus = 0
    status = "off"
  end
  Notify(string.format("statusline %s", status))
end

--- Toggle showtabline=2|0
function M.toggle_tabline()
  vim.opt.showtabline = vim.opt.showtabline:get() == 0 and 2 or 0
  Notify(string.format("tabline %s", bool2str(vim.opt.showtabline:get() == 2)))
end

--- Toggle codelens
function M.toggle_codelens()
  vim.g.codelens_enabled = not vim.g.codelens_enabled
  if not vim.g.codelens_enabled then
    vim.lsp.codelens.clear()
  end
  Notify(string.format("CodeLens %s", bool2str(vim.g.codelens_enabled)))
end

--- Toggle conceal=2|0
function M.toggle_conceal()
  vim.opt.conceallevel = vim.opt.conceallevel:get() == 0 and 2 or 0
  Notify(string.format("conceal %s", bool2str(vim.opt.conceallevel:get() == 2)))
end

--- Toggle diagnostics
function M.toggle_diagnostics()
  vim.g.diagnostics_mode = (vim.g.diagnostics_mode - 1) % 4
  vim.diagnostic.config(require("custom.configs.extras.lsp").diagnostics[vim.g.diagnostics_mode])
  if vim.g.diagnostics_mode == 0 then
    Notify "diagnostics off"
  elseif vim.g.diagnostics_mode == 1 then
    Notify "only status diagnostics"
  elseif vim.g.diagnostics_mode == 2 then
    Notify "virtual text off"
  else
    Notify "all diagnostics on"
  end
end
return M
