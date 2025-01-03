return {
  "NvChad/nvcommunity",
  { import = "nvcommunity.git.lazygit" },
  { import = "nvcommunity.editor.rainbowdelimiters" },
  { import = "nvcommunity.editor.illuminate" },
  { import = "nvcommunity.editor.rainbowdelimiters" },
  { import = "nvcommunity.file-explorer.oil-nvim" },
  { import = "nvcommunity.diagnostics.trouble" },

  { lazy = true, "nvim-lua/plenary.nvim" },
  { "wakatime/vim-wakatime", event = "BufReadPost" },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      {
        {
          "windwp/nvim-ts-autotag",
          config = function()
            require("nvim-ts-autotag").setup {
              opts = {
                -- Defaults
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = false, -- Auto close on trailing </
              },
              -- Also override individual filetype configs, these take priority.
              -- Empty by default, useful if one of the "opts" global settings
              -- doesn't work well in a specific filetype
              per_filetype = {
                ["html"] = {
                  enable_close = true,
                },
              },
            }
          end,
        },
      },
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  --
  {
    "ngtuonghy/live-server-nvim",
    event = "VeryLazy",
    build = ":LiveServerInstall",
    config = function()
      require("live-server-nvim").setup {
        custom = {
          "--port=8080",
          "--no-css-inject",
        },
        serverPath = vim.fn.stdpath "data" .. "/live-server/", --default
        open = "folder", -- folder|cwd     --default
      }
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "MagicDuck/grug-far.nvim",
    keys = {
      vim.keymap.set(
        "n",
        "<leader>gr",
        '<cmd>lua require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })<CR>',
        { desc = "Launch, limiting search/replace to current file" }
      ),

      vim.keymap.set(
        "v",
        "<leader>gr",
        '<cmd>lua require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") } })<CR>',
        { desc = "Launch with the current word under the cursor as the search string" }
      ),
    },
    config = function()
      require("grug-far").setup {}
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = {
      -- suggestion = { enabled = false },
      -- panel = { enabled = false },
      suggestion = {
        auto_trigger = true,
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "plugins.configs.luasnip"
        end,
        {
          "giuxtaposition/blink-cmp-copilot",
        },
      },
    },
    version = "*",
    -- opts = function()
    --   require "plugins.configs.blink"
    -- end,

    opts = {
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
      sources = {
        default = { "lsp", "luasnip", "path", "snippets", "buffer" },
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
    },
    opts_extend = { "sources.default" },
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      "pmizio/typescript-tools.nvim",
    },

    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    lazy = true,
    opts = require "plugins.configs.conform",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { char = "│", highlight = "Comment" },
      }
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require "plugins.configs.telescope",
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "mfussenegger/nvim-jdtls",
    -- ft = "java",
    config = function()
      require "plugins.configs.jdtls"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "plugins.configs.dap"
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- NOTE: NVCHAD UI
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  { "nvchad/volt" },
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "ngtuonghy/runner-nvchad",
    -- "runner-nvchad",
    -- dev = { true },
    -- lazy = trie,
    config = function()
      require("runner-nvchad").setup {}
    end,
  },

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "plugins.configs.dap"
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,      -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
