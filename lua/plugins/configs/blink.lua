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
    accept = { auto_brackets = { enabled = true } },
    -- documentation = { window = { border = "single" } },
    trigger = {
      show_on_keyword = true,
      show_on_trigger_character = true,
    },
    menu = {
      -- border = "single",
      draw = {
        -- padding = 1,
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
      },
    },
  },
  snippets = { preset = "luasnip" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    -- providers = {
    --   snippets = {
    --     opts = {
    --       search_paths = vim.g.vscode_snippets_path
    --     },
    --   },
    -- },
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
      Variable = "󰀫",
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
-- opts_extend = { "sources.default" },
