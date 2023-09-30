local overrides = require "custom.configs.overrides"
local plugins = {
  "NvChad/nvcommunity",
  { import = "nvcommunity.editor.treesittercontext" },
  { import = "nvcommunity.git.lazygit" },
  { import = "nvcommunity.git.diffview" },
  { import = "nvcommunity.editor.rainbowdelimiters" },
  "LazyVim/LazyVim",
  { import = "lazyvim.plugins.extras.lang.rust" },
  --------------------------------------------- disable plugins ---------------------------------------------

  --------------------------------------------- overrides plugins ---------------------------------------------
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
  { "folke/lazy.nvim", opts = overrides.lazynvim },
  { "nvim-colorizer.lua", enabled = true, opts = overrides.colorizer },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    opts = overrides.cmp,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = overrides.telescope,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v", "g", "]", "[" },
    opts = overrides.whichkey,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = overrides.indentblankline,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = overrides.devicons,
  },
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      require "custom.configs.LuaSnip"
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  --------------------------------------------- add and settings plugins ---------------------------------------------
  {
    "stevearc/dressing.nvim",
    lazy = false,
    config = function()
      require "custom.configs.extras.dressing"
    end,
  },

  -- {
  --   "tzachar/cmp-tabnine",
  --   event = "VeryLazy",
  --   build = "./install.sh",
  --   dependencies = "hrsh7th/nvim-cmp",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --       run_on_every_keystroke = true,
  --       snippet_placeholder = "..",
  --       ignored_file_types = {
  --         -- "Telescope",
  --         TelescopePrompt = true,
  --         -- default is not to ignore
  --         -- uncomment to ignore in lua:
  --         -- lua = true
  --       },
  --       show_prediction_strength = false,
  --     }
  --     --vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#bd4cf1" })
  --   end,
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.extras.noice"
    end,
  },

  -- format & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
  },
  --lsp
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require "custom.configs.lspconfig"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = overrides.nvimtreesitter,
  },
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
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
          "nvcheatsheet",
          "aerial",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      dofile(vim.g.base46_cache .. "dap")
      require "custom.configs.extras.dapconfig"
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    -- event = "VeryLazy",
    -- lazy = false,
    -- cmd = { "TroubleToggle", "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
        use_diagnostic_signs = true,
      }
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "custom.configs.extras.vim-illuminate"
    end,
  },
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    config = function()
      require "custom.configs.extras.yanky-nvim"
    end,
  },
  { "mg979/vim-visual-multi", event = "VeryLazy" },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
      require("session_manager").setup {
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
        autosave_ignore_dirs = { "nvdash" },
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.extras.flash"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "ngtuonghy/runner-nvim",
    cmd = { "Runnercode", "Runnerdebug", "Runnermakefile", "Runnerfast" },
    config = function()
      require("runner-nvim").setup {
        clearprevious = true,
        commands = {
          rust = {
            Makefile = "make",
          },
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "ngtuonghy/live-server-nvim",
    cmd = { "LiveServerStart", "LiveServerStop", "LiveServerInstall", "LiveServerToggle" },
    build = ":LiveServerInstall",
    config = function()
      require("live-server-nvim").setup {
        custom = { "--port=8888", "--quiet", "--no-css-inject" },
      }
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.extras.statuscol"
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
    config = function()
      require "custom.configs.extras.nvim-ufo"
    end,
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.extras.todo-comments"
    end,
  },

  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      -- disable_max_lines = vim.g.max_file.lines,
      -- disable_max_size = vim.g.max_file.size,
      layout = { min_width = 28 },
      -- icons = require "nvchad.icons.lspkind",
      show_guides = true,
      autojump = true,
      filter_kind = false,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
    },
    -- Optional dependencies
  },
  {
    "mrjones2014/smart-splits.nvim",
    opts = { ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" }, ignored_buftypes = { "nofile" } },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    -- lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  { "akinsho/git-conflict.nvim", event = "VeryLazy", version = "*", config = true },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup { mappings = {
        "<C-u>",
        "<C-d>",
      } }
    end,
  },
  {
    "potamides/pantran.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.extras.pantran"
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    cmd = {
      "CccHighlighterToggle",
      "CccPick",
      "CccConvert",
    },
    config = function()
      require("ccc").setup {
        highlighter = {
          auto_enable = false,
          lsp = true,
        },
      }
    end,
  },
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {}
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = function()
      require("better_escape").setup {
        mapping = { "jk", "jj" },
        timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by defaul
        clear_empty_lines = false, -- clear line after escaping if there is only whitespace
        keys = "<Esc>`^", -- keys used for escaping, if it is a function will use the result everytime
        -- example(recommended)
        -- keys = function()
        --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
        -- end, -- to se viet moy ai giu do nvim_win_get_cursor
      }
    end,
  },
  { "kevinhwang91/nvim-bqf", event = "VeryLazy" },
  {
    "ecthelionvi/NeoComposer.nvim",
    keys = { "Q" },
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
      require("NeoComposer").setup {
        notify = true,
        delay_timer = 150,
        keymaps = {
          play_macro = "Q",
          yank_macro = "yq",
          stop_macro = "cq",
          toggle_record = "q",
          cycle_next = "<c-n>",
          cycle_prev = "<c-p>",
          toggle_macro_menu = "<m-q>",
        },
      }
    end,
  },
  {
    "jcdickinson/http.nvim",
    build = "cargo build --workspace --release",
  },
  {
    "jcdickinson/codeium.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {
      -- "jcdickinson/http.nvim",
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
      -- vim.api.nvim_set_hl(0, "CmpItemKindCodeium", { fg = "#1fc5b1" })
    end,
  },

  {
    "monaqa/dial.nvim",
    lazy = false,
    config = function()
      require "custom.configs.extras.dial"
    end,
  },
  {

    "Pocco81/true-zen.nvim",
    event = "VeryLazy",
    config = function()
      require("true-zen").setup {}
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {}
    end,
  },
  {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.extras.hydra"
    end,
  },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
}

return plugins
