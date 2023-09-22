local ok_hydra, Hydra = pcall(require, "hydra")
if not ok_hydra then
  vim.notify("hydra not installed...", vim.log.ERROR)
  return
end

local M = {}
local hydra_options = require "custom.utils.hydra-options"
-- #fffff0

local ui = [[
  ^ ^               Options
  _a_: %{toggle_autopairs} Autopairs                     
  _c_: %{toggle_cmp} Autocompletion                      
  _d_: %{toggle_diagnostics} Diagnostic
  _n_: %{nu} number %{rnu} relative number 
  _N_: %{toggle_ui_notifications} Notifications
  _f_(_F_): %{toggle_buffer_autoformat} buffer (%{toggle_autoformat} global) AutoFormat
  _g_: %{toggle_signcolumn} Sign column
  _h_: %{toggle_foldcolumn} Fold column 
  _L_: %{toggle_foldcolumn} Code lens
  ^
                                   _q_,_<Esc>_: exit
]]

M.ui = Hydra {
  name = "Options",
  hint = ui,
  config = {
    color = "red",
    invoke_on_body = true,
    hint = {
      funcs = hydra_options,
      border = "rounded",
      position = "middle",
    },
  },
  mode = { "n", "x" },
  body = "<leader>o",
  heads = {
    {
      "a",
      function()
        local ok, autopairs = pcall(require, "nvim-autopairs")
        if ok then
          if autopairs.state.disabled then
            autopairs.enable()
          else
            autopairs.disable()
          end
        end
      end,
    },
    {
      "c",
      function()
        vim.g.cmp_enabled = not vim.g.cmp_enabled
      end,
    },
    {
      "N",
      function()
        vim.g.ui_notifications_enabled = not vim.g.ui_notifications_enabled
      end,
    },
    {
      "n",
      function()
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
      end,
      { desc = "number" },
    },
    {
      "d",
      function()
        vim.g.diagnostics_mode = (vim.g.diagnostics_mode - 1) % 4
        vim.diagnostic.config(require("custom.configs.extras.lsp").diagnostics[vim.g.diagnostics_mode])
      end,
      { desc = "diagnostic" },
    },
    { --- Toggle auto format
      "F",
      function()
        vim.g.autoformat_enabled = not vim.g.autoformat_enabled
      end,
    },
    { -- Toggle buffer local auto format
      "f",
      function()
        local old_val = vim.b.autoformat_enabled
        if old_val == nil then
          old_val = vim.g.autoformat_enabled
        end
        vim.b.autoformat_enabled = not old_val
      end,
    },
    {
      "g",
      --- Toggle signcolumn="auto"|"no"
      function()
        if vim.wo.signcolumn == "no" then
          vim.wo.signcolumn = "yes"
        elseif vim.wo.signcolumn == "yes" then
          vim.wo.signcolumn = "auto"
        else
          vim.wo.signcolumn = "no"
        end
      end,
    },
    {
      "h",
      --- Toggle foldcolumn=0|1
      function()
        local last_active_foldcolumn
        local curr_foldcolumn = vim.wo.foldcolumn
        if curr_foldcolumn ~= "0" then
          last_active_foldcolumn = curr_foldcolumn
        end
        vim.wo.foldcolumn = curr_foldcolumn == "0" and (last_active_foldcolumn or "1") or "0"
      end,
    },
    {
      "L",
      -- Toggle codelens
      function()
        vim.g.codelens_enabled = not vim.g.codelens_enabled
        if not vim.g.codelens_enabled then
          vim.lsp.codelens.clear()
        end
      end,
    },
    { "<Esc>", nil, { exit = true } },
    { "q", nil, { exit = true } },
  },
}

local buffer = [[
    ^ ^ Step ^ ^ ^       ^ ^             Action
 ----^-^-^-^--^-^----    ^-^----------------------------------  
     ^ ^ ^ ^ ^ ^ ^ ^    ^ ^ ^ ^_c_: Close buffer
     ^ ^ ^ ^ ^ ^ ^        _l_: Close buffer tab left
 left _i_ ^ ^ _o_ right  _r_: Close buffer tab right
     ^ ^ ^ ^ ^ ^ ^        _a_: Close all buffers except current
     ^ ^ ^ ^ ^ ^ ^ ^    ^ ^ ^ ^_A_: Close all buffers

^ ^  _q_: exit
]]
M.buffer = Hydra {
  name = "Options",
  hint = buffer,
  config = {
    color = "red",
    invoke_on_body = true,
    hint = {
      funcs = hydra_options,
      border = "rounded",
      position = "bottom",
    },
  },
  mode = { "n", "x" },
  body = "<leader>bo",
  heads = {
    {
      "i",
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      { desc = "Move buffer tab left" },
    },
    {
      "o",
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      { desc = "buffer tab right" },
    },
    {
      "c",
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      { desc = "close buffer" },
    },
    {
      "l",
      function()
        require("nvchad.tabufline").closeBufs_at_direction "left"
      end,
      { desc = "Close all buffers to the left" },
    },
    {
      "r",
      function()
        require("nvchad.tabufline").closeBufs_at_direction "right"
      end,
      { desc = "Close all buffers to the right" },
    },
    {
      "a",
      function()
        require("nvchad.tabufline").closeOtherBufs()
      end,
      { desc = "Close all buffers except current" },
    },
    {
      "A",
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      { desc = "Close all buffers" },
    },
    { "q", nil, { exit = true } },
  },
}
return M
