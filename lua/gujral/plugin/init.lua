-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '*',
		requires = { { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } },
		config = function()
			require("gujral.plugin.telescope")
		end,
	}

	use {
		'rebelot/kanagawa.nvim', as = 'kanagawa'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ":TSUpdate",
		config = function()
			require("gujral.plugin.treesitter")
		end,
	}

	use {
		'neovim/nvim-lspconfig'
	}

	use {
		'mason-org/mason.nvim',
		config = function()
			require("gujral.plugin.mason")
		end,
	}

	use {
		'mason-org/mason-lspconfig.nvim',
		requires = {
			'mason-org/mason.nvim',
		},
		after = 'mason.nvim',
		config = function()
			require("gujral.plugin.mason-lspconfig")
		end,
	}

	use {
		'lervag/wiki.vim',
		setup = function()
			require("gujral.plugin.wiki")
		end,
	}

	use {
		'saghen/blink.cmp',
		tag = '*',
		requires = {
			'rafamadriz/friendly-snippets',
			'mason-org/mason.nvim',
		},
		after = { 'mason.nvim', 'mason-lspconfig.nvim' },
		config = function()
			require('gujral.plugin.blink')
		end,
	}

	use {
		'rachartier/tiny-inline-diagnostic.nvim',
		config = function()
			require('gujral.plugin.tiny-inline-diagnostic')
		end,
	}

	use {
		'MeanderingProgrammer/render-markdown.nvim',
		after = { 'nvim-treesitter' },
		config = function()
			require('render-markdown').setup({})
		end,
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('gujral.plugin.nvim-tree')
		end,
	}

	use {
		'lewis6991/gitsigns.nvim',
	}

	-- use {
	-- 	'romgrk/barbar.nvim',
	-- 	config = function()
	-- 		require('gujral.plugin.barbar')
	-- 	end
	-- }

	use {
		'stevearc/conform.nvim',
		config = function()
			require('gujral.plugin.conform')
		end
	}

	use {
		'cohama/lexima.vim'
	}

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require('gujral.plugin.harpoon')
		end
	}
end)
