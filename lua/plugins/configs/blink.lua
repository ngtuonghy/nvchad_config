return {
  -- 'default' for mappings similar to built-in completion
  -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
  -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
  -- See the full "keymap" documentation for information on defining your own keymap.
  keymap = {
    preset = "super-tab",
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-up>"] = { "scroll_documentation_up", "fallback" },
    ["<C-down>"] = { "scroll_documentation_down", "fallback" },
  },
  signature = {
    enabled = true,
    -- window = { border = "single" }
  },
  completion = {
    accept = { auto_brackets = { enabled = false } },
    -- documentation = { window = { border = "single" } },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    -- trigger = {
    --   show_on_keyword = true,
    --   show_on_trigger_character = true,
    -- },
    menu = {
      -- border = "single",
      draw = {
        -- padding = 1,
        -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
      },
    },
  },
  snippets = { preset = "luasnip" },
  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer" --[[, "copilot" ]],
    },
    providers = {
      -- copilot = {
      --   name = "copilot",
      --   module = "blink-cmp-copilot",
      --   score_offset = 100,
      --   async = true,
      --   transform_items = function(_, items)
      --     local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
      --     local kind_idx = #CompletionItemKind + 1
      --     CompletionItemKind[kind_idx] = "Copilot"
      --     for _, item in ipairs(items) do
      --       item.kind = kind_idx
      --     end
      --     return items
      --   end,
      -- },
    },
  },
  appearance = {
    -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    -- Useful for when your theme doesn't support blink.cmp
    -- Will be removed in a future release
    use_nvim_cmp_as_default = true,
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
    kind_icons = {
      Namespace = "󰌗",
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰆧", --  "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = '󰆦', --"󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "", --  "󰅩",
      Property = "󰖷", -- "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "", -- "󰦨",
      Keyword = "󰌋", --"󰻾",
      Snippet = "󱄽", --"",
      Color = "󰏘",
      File = "󰈔", -- "󰈚",
      Reference = "󰬲", -- "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰪚", -- "󰆕"
      TypeParameter = "󰬛", -- "󰊄",
      Table = "",
      Object = "󰅩",
      Tag = "",
      Array = "[]",
      Boolean = "",
      Number = "",
      Null = "󰟢",
      Supermaven = "",
      String = "󰉿",
      Calendar = "",
      Watch = "󰥔",
      Package = "",
      Copilot = "",
      Codeium = "",
      TabNine = "",
      BladeNav = "",
    },
  },
}
