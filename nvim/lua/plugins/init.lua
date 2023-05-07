require("plugins.conf")

local fn = vim.fn

local packer_install_dir = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap = false
if not require('core.utils').file_exists(packer_install_dir .. '/lua/packer.lua') then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1',
                                  'https://github.com/wbthomason/packer.nvim', packer_install_dir
                                 })
end

require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'
    -- Install Lua interface for FZF
    use {                                                   
        'ibhagwan/fzf-lua',
        config = require('plugins.conf.fzf-lua').config,
        requires = {
            'vijaymarupudi/nvim-fzf',
            'kyazdani42/nvim-web-devicons'
        },
    }
    -- Install FZF
    use {                                                   
        'junegunn/fzf',
        run = './install --bin',
    }
    -- Sane binding to navigate between vim and tmux
    use {                                                   
        'christoomey/vim-tmux-navigator',
    }
    -- Snippet collection
    use {
        'L3MON4D3/LuaSnip',
        after = {'nvim-cmp'},
        config = require("plugins.conf.LuaSnip").config, 
        requires = {'rafamadriz/friendly-snippets'}
    }
    -- Autocomplete parenthesis
    use 'windwp/nvim-autopairs'

    --------------------
    ----  Completion  --
    --------------------
    
    -- Enable the built-in LSP
    use {
        'neovim/nvim-lsp',
        requires = {
            'neovim/nvim-lspconfig', -- Easier configuration interface for Neovim LSP
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = require('plugins.conf.nvim-lsp').config
    }
    -- LspInstaller
    use {
        'williamboman/nvim-lsp-installer',
        requires = {'neovim/nvim-lspconfig'},
        config = require('plugins.conf.nvim-lsp').nvim_lsp_installer_setup
    }
    -- Provide autocompletion
    use {
        'hrsh7th/nvim-cmp',
        config = require('plugins.conf.nvim-cmp').config,
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'quangnguyen30192/cmp-nvim-ultisnips',
            'nvim-treesitter/completion-treesitter',
            'saadparwaiz1/cmp_luasnip',
        },
    }
    -- Provide Syntax information
    use {
        'nvim-treesitter/nvim-treesitter',
        config = require("plugins.conf.nvim-treesitter").config,
        run = ':TSUpdate',
    }

    -- comments based on the file type
    use 'tpope/vim-commentary'  
    -- Git interface
    use {
        'tpope/vim-fugitive',
    }

    -- Git information on the sign column
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = require("plugins.conf.gitsigns").config
    }

    -- Colour highlighter
    use {
        'norcalli/nvim-colorizer.lua',
    }
    -- Colour scheme with support for treesitter syntax
      use {
          'navarasu/onedark.nvim',
     }

    -- Status line and buffer line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kdheepak/tabline.nvim',
        },
    }
    -- Better buffers and tabs. Only used for tabs in lualine
    use {
        'kdheepak/tabline.nvim',
        requires = {
            'nvim-lualine/lualine.nvim',
            'kyazdani42/nvim-web-devicons',
        },
    }

    -- Python language folding
    use {
        'tmhedberg/SimpylFold',
        ft = 'python',
    }
    -- Brings command such as ClangFormat
    use {
        'rhysd/vim-clang-format',
        ft = 'cpp',
    }

    -- Black nvim format
    use 'averms/black-nvim' 

    -- Vim Markdown - Many conceal and folding features
    use {
        'plasticboy/vim-markdown',
        ft = { 'markdown', 'pandoc', 'vimwiki.markdown' },
    }

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })


    use {
        'sindrets/diffview.nvim',
    }
    -- Show symbols information on side window
    use {
        'majutsushi/tagbar',
        cmd = 'TagbarToggle',
    }
    -- Set of Lua functions used by other plugins
    use 'nvim-lua/plenary.nvim'
    -- Show files on side window
    use {
        'kyazdani42/nvim-tree.lua',
        cmd = 'NvimTreeToggle',
        config = require("plugins.conf.nvim-tree").config,
        requires = {'kyazdani42/nvim-web-devicons'},
    }

    use 'tpope/vim-surround'
    
    -- Sensible defaults for [n]vim
    use 'tpope/vim-sensible'     
    use 'tpope/vim-repeat'
    use 'tpope/vim-eunuch'

    use 'SirVer/ultisnips'
    use 'junegunn/vim-easy-align'

    if packer_bootstrap then
        require('packer').sync()
        require('packer').compile()
    end
end)

