return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local parsers = { "bash", "diff", "git_config", "git_rebase", "gitcommit", "json", "toml", "yaml" }
      require("nvim-treesitter").install(parsers)

      vim.treesitter.language.register("json", "jsonc")
      vim.treesitter.language.register("git_config", "gitconfig")
      vim.treesitter.language.register("git_rebase", "gitrebase")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "bash", "sh", "diff", "gitconfig", "gitrebase", "gitcommit", "json", "jsonc", "toml", "yaml" },
        callback = function(event)
          pcall(vim.treesitter.start, event.buf)
        end,
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        globalstatus = true,
        theme = "auto",
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer-local keymaps",
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader><leader>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Jump in buffer",
      },
    },
  },

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite" },
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.lsp.config("lua_ls", {
        on_init = function(client)
          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
            runtime = {
              version = "LuaJIT",
              path = { "lua/?.lua", "lua/?/init.lua" },
            },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
          })
        end,
        settings = { Lua = {} },
      })
      vim.lsp.enable("lua_ls")
    end,
  },
}
