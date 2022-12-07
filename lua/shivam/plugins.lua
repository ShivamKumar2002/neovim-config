local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Install your plugins here
return packer.startup(function(use)

    -- Plugins here


    -- Have packer manage itself
    use {
         "wbthomason/packer.nvim",
    }

    -- Required by many other plugins
    use {
        "nvim-lua/plenary.nvim",
    }

    -- Speed up loading Lua modules in Neovim to improve startup time
    use {
        "lewis6991/impatient.nvim",
        config = function() require("shivam/impatient") end,
    }

    -- web-devicons for neovim
   use {
        "kyazdani42/nvim-web-devicons",
    }

    -- A super powerful autopair plugin for Neovim that supports multiple characters
    use {
        "windwp/nvim-autopairs",
        config = function() require("shivam/autopairs") end,
    }

    -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    use {
        "numToStr/Comment.nvim",
         config = function() require("shivam/comment") end,
   }

    -- A File Explorer For Neovim
    use {
        "kyazdani42/nvim-tree.lua",
        config = function() require("shivam/nvim-tree") end,
   }

    -- Fix CursorHold Performance
    use {
        "antoinemadec/FixCursorHold.nvim",
        config = function() require("shivam/cursorhold") end,
    }

    -- A snazzy 💅 buffer line (with minimal tab integration) for Neovim built using lua
    use {
        "akinsho/bufferline.nvim",
        config = function() require("shivam/bufferline") end,
   }

    -- Animation statusline, floating window statusline. Use lua + luv make some 🔥🔥🔥
    use {
        "windwp/windline.nvim",
        config = function() require("shivam/windline") end,
    }

    -- project.nvim is an all in one neovim plugin written in lua that provides superior project management
    use {
        "ahmedkhalf/project.nvim",
        config = function() require("shivam/project") end,
    }

    -- This plugin adds indentation guides to all lines
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("shivam/indentline") end,
    }

    -- a lua powered greeter like vim-startify / dashboard-nvim 
    use {
        "goolord/alpha-nvim",
        config = function() require("shivam/alpha") end,
    }


	-- Colorschemes

    -- Dracula theme with additional goodies like LSP, Treesitter etc support
	use {
        "Mofiqul/dracula.nvim",
    }


    -- Completion Plugins

    -- The main completion plugin
    use {
        "hrsh7th/nvim-cmp",
        config = function() require("shivam/cmp") end,
    }

    -- buffer completions
    use {
        "hrsh7th/cmp-buffer",
    }

    -- path completions
    use {
        "hrsh7th/cmp-path",
    }

    -- cmdline completions
    use {
        "hrsh7th/cmp-cmdline",
    }

    -- snippet completions
    use {
        "saadparwaiz1/cmp_luasnip",
    }

    -- nvim-lsp completions
    use {
        "hrsh7th/cmp-nvim-lsp",
    }


    -- Snippets

    -- Snippet engine
    use {
        "L3MON4D3/LuaSnip",
    }

    -- a bunch of snippets to use
    use {
        "rafamadriz/friendly-snippets",
    }


    -- LSP

    -- Enable LSP
    use {
        "neovim/nvim-lspconfig",
        config = function() require("shivam/lsp") end,
    }

	-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
    use {
        "williamboman/mason.nvim",
		config = function() require ("shivam/mason") end,
    }

    -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
    use {
        "williamboman/mason-lspconfig.nvim",
    }

    -- Formatting, Linting and more. Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("shivam/null-ls") end,
    }


    -- Telescope

    -- Find, Filter, Preview, Pick
    use {
        "nvim-telescope/telescope.nvim",
        config = function() require("shivam/telescope") end,
    }

    -- FZF sorter for telescope written in c
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    }


    -- Treesitter

    -- Nvim Treesitter configurations and abstraction layer
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function() require("shivam/treesitter") end,
    }

    -- Rainbow parentheses for neovim using tree-sitter 🌈
    use {
        "p00f/nvim-ts-rainbow",
    }

    -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
    }


    -- Git

    -- Super fast git decorations
    use {
        "lewis6991/gitsigns.nvim",
        config = function() require("shivam/gitsigns") end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
