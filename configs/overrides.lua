local M = {}
M.lazynvim = {
  checker = {
    -- automatically check for plugin updates
    enabled = true,
  },
}
M.nvimtree = {
  on_attach = require("custom.configs.nvim-tree").on_attach,
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  view = {
    width = 30,
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    icons = {
      git_placement = "before",
      show = {
        git = true,
      },
      glyphs = {
        git = {
          unstaged = "󰄱",
          staged = "",
          unmerged = "",
          renamed = "󰁕",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  live_filter = {
    prefix = " [FILTER]: ",
    always_show_folders = false,
  },
  trash = {
    cmd = "gio trash",
  },
}

local cmp = require "cmp"
local getCmp = require "custom.configs.cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_map = getCmp.cmp_map
M.cmp = {
  enabled = function()
    return vim.g.cmp_enabled
  end,
  cmp.setup.filetype("TelescopePrompt", {
    enabled = false,
  }),

  ---------------------
  vim.api.nvim_set_hl(0, "CmpGhostText", { fg = "#4e5665" }),
  formatting = getCmp.formatting_style,
  mapping = {
    ["<C-k>"] = cmp_map(cmp.mapping.select_prev_item(cmp_select)),
    ["<C-j>"] = cmp_map(cmp.mapping.select_next_item(cmp_select)),
    ["<C-d>"] = cmp_map(cmp.mapping.scroll_docs(-4)),
    ["<C-f>"] = cmp_map(cmp.mapping.scroll_docs(4)),
    ["<C-Space>"] = cmp_map(getCmp.toggle_complete(), { "i", "c", "s" }),
    ["<Tab>"] = cmp.mapping {
      i = getCmp.complete,
      c = getCmp.cmdline_complete,
    },
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "codeium" },
    { name = "luasnip" },
    -- { name = "cmp_tabnine" },
    -- { name = "nvim_lsp_signature_help" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  experimental = {
    ghost_text = {
      hl_group = "CmpGhostText",
    },
    native_menu = false,
  },
  window = {
    completion = { scrollbar = true },
  },
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  }),
  cmp.setup.cmdline(":", {
    formatting = {
      fields = { "abbr", "kind" },
    },
    sources = cmp.config.sources {
      { name = "cmdline" },
      { name = "path" },
    },
  }),
}

local wk = require "which-key"
M.whichkey = {
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "", -- symbol prepended to a group
  },
  show_help = true,
  wk.register {
    ["<leader>"] = {
      l = { name = " lsp" },
      d = { name = " Debugger" },
      f = { name = " Find" },
      b = { name = "󰓩 Buffers" },
      g = { name = "󰊢 Git" },
      p = { name = "󰏖 Packages" },
      x = { name = "󰁨 diagnostics/quickfix" },
      w = { name = " window" },
      u = { name = " UI/UX" },
      s = { name = "󱂬 Session" },
      r = { name = " Replace" },
    },
  },
}

M.indentblankline = {
  filetype_exclude = {
    "help",
    "alpha",
    "dashboard",
    "neo-tree",
    "Trouble",
    "lazy",
    "mason",
    "notify",
    "toggleterm",
    "lazyterm",
    "noice",
    "nvdash",
    "nvcheatsheet",
    "aerial",
  },
  buftype_exclude = { "terminal", "nofile" },
  show_trailing_blankline_indent = false,
  show_current_context = false,
}

M.colorizer = {
  filetypes = {
    "*", -- Highlight all files, but customize some others.
    cmp_docs = { always_update = true },
  },
  user_default_options = {
    names = false,
    mode = "background",
    RGB = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    tailwind = true,
    css = true,
  },
}

M.telescope = {
  file_ignore_patterns = { "node_modules", ".docker", ".git", "yarn.lock", "go.sum", "go.mod", "tags", "mocks" },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
  extensions_list = {
    "themes",
    "terms",
    "file_browser",
    "lazygit",
    "noice",
    "yank_history",
    "fzf",
    "macros",
    "projects",
  },
}

M.devicons = {}
M.treesitter = {
  autotag = {
    enable = true,
  },
}
M.nvimtreesitter = {
  auto_install = true,
  enable_autocmd = false,
}
return M
