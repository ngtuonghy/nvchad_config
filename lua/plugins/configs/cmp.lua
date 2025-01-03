local cmp = require "cmp"

return {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },

    -- luasnip
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    format = function(entry, item)
      local icons = require "icons.lspkind"
      local icon = icons[item.kind] or ""
      local kind = item.kind or ""
      -- item.menu = kind
      item.menu_hl_group = "CmpItemMenu" .. kind
      item.kind = icon
      return item
    end,
    fields = { "kind", "abbr", "menu" },
  },

  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  -- CmpDocBorder
  window = {
    completion = {
      scrollbar = false,
      side_padding = 1,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None,FloatBorder:CmpBorder",
      border = "single",
    },

    documentation = {
      border = "single",
      winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
    },
  },
}
