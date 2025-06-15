return {
  "NvChad/nvcommunity",
  { import = "nvcommunity.editor.rainbowdelimiters" },
  { import = "nvcommunity.editor.illuminate" },
  { import = "nvcommunity.file-explorer.oil-nvim" },

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
        "n",
        "<leader>rC",
        '<cmd>lua require("grug-far").open()<CR>',
        { desc = "Launch, limiting search/replace cwd" }
      ),
      vim.keymap.set(
        "v",
        "<leader>rC",
        '<cmd>lua require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>")  } })<CR>',
        { desc = "Launch with the current word under the cursor as the search string" }
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
    enabled= true,
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        keymap = {
          accept = "<Tab>", -- "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
              require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets" } }
            end,
          },
        },
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
      },
      -- "giuxtaposition/blink-cmp-copilot",
    },
    version = "*",
    opts = require "plugins.configs.blink",
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
    enabled = false, -- Disable this plugin if you don't use Java
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
    enabled = true,
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
    enabled = false, -- Disable this plugin if you don't use Copilot Chat
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
  },

  {
    "sindrets/diffview.nvim",
  },

  { "akinsho/git-conflict.nvim", enabled = false, version = "*", config = true },

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

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = require "plugins.configs.snacks",
    -- keys = {
    --   {
    --   --   "<c-m>",
    --   --   function()
    --   --     Snacks.terminal()
    --   --   end,
    --   --   desc = "Toggle Terminal",
    --   -- },
    --   -- {
    --   --   "<c-_>",
    --   --   function()
    --   --     Snacks.terminal()
    --   --   end,
    --   --   desc = "which_key_ignore",
    --    },
    --},
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.todo-comments"
    end,
    keys = {
      {
        "<leader>st",
        function()
          Snacks.picker.todo_comments()
        end,
        desc = "Todo",
      },
      {
        "<leader>sT",
        function()
          Snacks.picker.todo_comments { keywords = { "TODO", "FIX", "FIXME" } }
        end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },

  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
}
