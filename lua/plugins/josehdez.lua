return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "EdenEast/nightfox.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },
  -- disable trouble
  { "folke/trouble.nvim", enabled = false },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-emoji",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Left>"] = cmp.mapping.abort(),
          ["<Right>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "emoji" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "BufEnter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      toggler = {
        line = "<c-.>",
        -- block = "<c-.>",
      },
      -- opleader = {
      --   line = "<c-.>",
      -- },
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
    -- keys = {
    --   { "<c-.>", "gcc", desc = "Comment" },
    --   { "<c-.>", "gc", desc = "Bloque comment" },
    -- },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "" },
        change = { text = "" },
        delete = { text = "󰆴" },
        topdelete = { text = "󰗨" },
        changedelete = { text = "󱂨" },
        untracked = { text = "󰃆" },
      },
      signcolumn = true,
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    -- opts = {
    --   event_handlers = {
    --     event = "file_opened",
    --     handler = function(file)
    --       print("-auto close", file)
    --       require("neo-tree").close_all()
    --     end,
    --   },
    -- },
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
              enable = false,
            },
          },
        },
      })
    end,
    -- keys = {
    --   { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", remap = true },
    --   { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Busca Archivo", remap = true },
    -- },
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  {
    "voldikss/vim-floaterm",
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettier",
        "css-lsp",
        "emmet-language-server",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.prettier,
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- disable the keymap to grep files
      { "<leader>/", false },
      { "<leader>ff", false },
      { "<leader>fb", false },
      -- { "<leader>/", "<cmd>Telescope find_files<cr>", desc = "Buscar Archivos" },
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Archivos" },
      { "<C-b>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Buscar en todos lados" },
    },
  },
  { "mbbill/undotree" },
}
