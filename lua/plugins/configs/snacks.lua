local function term_nav(dir)
  return function(self)
    return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
      vim.cmd.wincmd(dir)
    end)
  end
end
return {
  bigfile = {
    enabled = true,
    notify = true, -- show notification when big file detected
    size = 1.5 * 1024 * 1024, -- 1.5MBfalse
    -- Enable or disable features when big file detected
    ---@param ctx {buf: number, ft:string}
    setup = function(ctx)
      if vim.fn.exists ":NoMatchParen" ~= 0 then
        vim.cmd [[NoMatchParen]]
      end
      Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
      vim.b.minianimate_disable = true
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(ctx.buf) then
          vim.bo[ctx.buf].syntax = ctx.ft
        end
      end)
    end,
  },
  notifier = { enabled = true },
  notify = { enabled = true },
  lazygit = { enabled = true },
  picker = { enabled = true },
  git = { enabled = true },
  toggle = { enabled = true },
  dim = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
   words = { enabled = true },
  indent = {
    enabled = true,
    priority = 1,
    char = "│",
    only_scope = false, -- only show indent guides of the scope
    only_current = false, -- only show indent guides in the current window
    hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
    -- can be a list of hl groups to cycle through
    -- hl = {
    --     "SnacksIndent1",
    --     "SnacksIndent2",
    --     "SnacksIndent3",
    --     "SnacksIndent4",
    --     "SnacksIndent5",
    --     "SnacksIndent6",
    --     "SnacksIndent7",
    --     "SnacksIndent8",
    -- }
  },
  terminal = {
    win = {
      keys = {
        nav_h = { "<C-h>", term_nav "h", desc = "Go to Left Window", expr = true, mode = "t" },
        nav_j = { "<C-j>", term_nav "j", desc = "Go to Lower Window", expr = true, mode = "t" },
        nav_k = { "<C-k>", term_nav "k", desc = "Go to Upper Window", expr = true, mode = "t" },
        nav_l = { "<C-l>", term_nav "l", desc = "Go to Right Window", expr = true, mode = "t" },
      },
    },
  },
}
