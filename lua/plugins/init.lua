return {
  "NvChad/nvcommunity",
  -- { import = "nvcommunity.git.lazygit" },
  { import = "nvcommunity.editor.rainbowdelimiters" },
  { import = "nvcommunity.editor.illuminate" },
  { import = "nvcommunity.editor.rainbowdelimiters" },
  { import = "nvcommunity.file-explorer.oil-nvim" },
  -- { import = "nvcommunity.diagnostics.trouble" },

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
        "<leader>rc",
        '<cmd>lua require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })<CR>',
        { desc = "Launch, limiting search/replace to current file" }
      ),

      vim.keymap.set(
        "v",
        "<leader>rc",
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
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<S-Tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = "rafamadriz/friendly-snippets",
        -- opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          -- require("luasnip").config.set_config(opts)
          require "plugins.configs.luasnip"
        end,
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
    opts = require "plugins.configs.gitsigns",
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
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    config = function()
      require "plugins.configs.which-key"
    end,
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
    ft = "markdown", -- If you decide to lazy-load anyway
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    dependencies = {
      { "kkharji/sqlite.lua" },
    },
    config = function()
      require("yanky").setup {
        highlight = { timer = 100 },
        ring = { storage = "sqlite", history_length = 1000 },
        history_length = 1000,
      }
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require "plugins.configs.statuscol"
        end,
      },
    },
    event = "VeryLazy",
    config = function()
      require "plugins.configs.nvim-ufo"
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "sindrets/diffview.nvim",
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup()
      local x = vim.diagnostic.severity
      vim.diagnostic.config {
        virtual_text = false,
        signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
        underline = true,
        float = { border = "single" },
      }
    end,
  },
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
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
    },
    keys = {
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>P", function() Snacks.picker() end, desc = "Show all pickers" },
    {
        "<leader>gf",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit Current File History",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit.log()
        end,
        desc = "Lazygit Log (cwd)",
      },
    },
  },
}
