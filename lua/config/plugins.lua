-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if lazy folders/files does not exist, install lazy
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", 
                                "clone",
                                "--filter=blob:none",
                                "--branch=stable",
                                lazyrepo,
                                lazypath })


    -- if there is an error, do this instead
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)       -- rtp = runtime path, prepend searches paths
                                    -- to find what it doesn't know
                                    -- right here, it looks for lazy commands
                                    -- this command ==
                                    -- vim.opt.rtp.prepend(vim.opt.rtp, lazypath)
                                    -- colon shortcuts adding command as param


-- Setup lazy.nvim
require("lazy").setup({
    -- install kanagawa colorscheme
    {
        "rebelot/kanagawa.nvim",
        config = function()
            -- I comment this out so that it doesn't try to 
            -- change colorscheme twice
            -- But, I want to keep kanagawa around, so...
            --vim.cmd.colorscheme("kanagawa-dragon")
        end,
    },
    -- install and switch to onedark colorscheme
    {
        "navarasu/onedark.nvim",
        -- the below is a callback function for this
        -- install table.  Ensures that install 
        -- above finishes before doing the switch
        config = function()
            vim.cmd.colorscheme("onedark")
        end,

    },
    -- install and set up treesitter (parser engine?)
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c",
                                    "lua",
                                    "vim",
                                    "vimdoc",
                                    "query",
                                    "java",
                                    "kotlin"
                                },
                -- installs any parser that it knows,
                -- even if not listed above
                auto_install = true,

                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                      init_selection = "<Leader>ss",        --"gnn", 
                      node_incremental = "<Leader>si",      --"grn",
                      scope_incremental = "<Leader>sc",     --"grc",
                      node_decremental = "<Leader>sd",      --"grm",
                },
            }
        })
        end,
    },
    -- install lsp configuration for lsp server ops
    {
        "neovim/nvim-lspconfig",
        -- no setup here because mason-lspconfig will handle it.
    },
    -- install mason plugin to download and install
    -- language servers easily
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        config = function()
            require("nvim-tree").setup({
                sort = {
                    sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },
    -- install mason-lspconfig to set up lspconfig
    {
        "williamboman/mason-lspconfig",
        dependencies = { "mason.nvim" },
        -- vhyrro showed more to do below,
        -- but updates seem to have negated
        -- what he showed.  This is all that is needed.
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    -- install blink.cmp for completion 
    {
      "saghen/blink.cmp",
      -- optional: provides snippets for the snippet source
      dependencies = { "rafamadriz/friendly-snippets" },

      -- use a release tag to download pre-built binaries
      version = '1.*',

      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        keymap = { preset = 'default' },

        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { "lazydev", "lsp", "path", "snippets", "buffer" },
          providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100, -- make lazydev completions top of list
                },
            },
        },

        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    -- lazy dev to fix some things.
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
    },
})




