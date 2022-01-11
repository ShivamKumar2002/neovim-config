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
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use 'nvim-lua/plenary.nvim' -- Required by many other plugins
    use 'kyazdani42/nvim-web-devicons' -- web-devicons for neovim
    use "windwp/nvim-autopairs" -- A super powerful autopair plugin for Neovim that supports multiple characters
    use 'numToStr/Comment.nvim'  -- Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
    use {'kyazdani42/nvim-tree.lua', config = function() require'nvim-tree'.setup {} end}  -- A File Explorer For Neovim
    use 'antoinemadec/FixCursorHold.nvim'  -- Fix CursorHold Performance

	-- Colorschemes
	use 'Mofiqul/dracula.nvim'   -- Dracula theme with additional goodies like LSP, Treesitter etc support

    -- Completion Plugins
    use "hrsh7th/nvim-cmp" -- The main completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"  -- nvim-lsp completions

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

    -- Telescope
    use 'nvim-telescope/telescope.nvim' -- Find, Filter, Preview, Pick
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- FZF sorter for telescope written in c

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }  -- Nvim Treesitter configurations and abstraction layer
    use "p00f/nvim-ts-rainbow" -- Rainbow parentheses for neovim using tree-sitter 🌈
    use 'JoosepAlviste/nvim-ts-context-commentstring'  -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file

    -- Git
    use "lewis6991/gitsigns.nvim"  -- Super fast git decorations

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
