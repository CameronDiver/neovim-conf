-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Install plugins
return packer.startup(function(use)
	-- Add you plugins here:
	use 'wbthomason/packer.nvim' -- packer can manage itself
	use 'echasnovski/mini.nvim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		}
	}
	use 'neovim/nvim-lspconfig'
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use 'mhartington/formatter.nvim'

	use "williamboman/nvim-lsp-installer"
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use "kdheepak/lazygit.nvim"
	use "hrsh7th/nvim-cmp"
	use 'hrsh7th/cmp-nvim-lsp'

	use 'SirVer/ultisnips'
	use 'quangnguyen30192/cmp-nvim-ultisnips'
	use 'vimwiki/vimwiki'

	-- Colour schemes
	-- use "joshdick/onedark.vim"
	--	use "jacoborus/tender.vim"
	-- use "savq/melange"
	-- use 'folke/tokyonight.nvim'
	use 'marko-cerovac/material.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end

end)
