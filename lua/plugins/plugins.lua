	vim.cmd [[packadd packer.nvim]]


 --https://github.com/w0rp/ale
-- https://github.com/neoclide/coc.nvim.git
-- https://github.com/ctrlpvim/ctrlp.vim
-- https://github.com/dracula/vim.git
-- https://github.com/itchyny/lightline.vim
-- https://github.com/phaazon/mind.nvim.git
-- https://github.com/scrooloose/nerdtree
-- https://github.com/nvim-treesitter/nvim-treesitter.git
-- https://github.com/roxma/nvim-yarp.git
-- https://github.com/rayburgemeestre/phpfolding.vim.git
-- https://github.com/scrooloose/syntastic
-- https://github.com/majutsushi/tagbar
-- https://github.com/tomtom/tlib_vim.git
-- https://github.com/MarcWeber/vim-addon-mw-utils.git
-- https://github.com/tpope/vim-commentary.git
-- https://github.com/tpope/vim-fugitive
-- https://github.com/airblade/vim-gitgutter
-- https://github.com/ludovicchabant/vim-gutentags
-- git@github.com:tpope/vim-sensible.git
-- https://github.com/garbas/vim-snipmate.git
-- https://github.com/tpope/vim-surround
-- https://github.com/christoomey/vim-tmux-navigator
-- https://github.com/christoomey/vim-tmux-runner.git
-- https://github.com/mg979/vim-visual-multi.git

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'phaazon/mind.nvim',
		branch = 'v2.2',
		requires = { 'nvim-lua/plenary.nvim' }, config = function()
			local opts
			opts = {
				persistence = {
					state_path = "~/Dropbox/mind/mind.json",
					data_dir = "~/Dropbox/mind"
				}
			}
			require 'mind'.setup(opts)
		end
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			require('telescope').setup{
				defaults = {
					file_ignore_patterns = { ".git", ".hg", ".svn", "node_modules", "tmp", "logs", "vendor","dist" }
				}
			}
		end
	}
	use 'scrooloose/nerdtree'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-surround'
	use 'tpope/vim-sensible'
	use 'christoomey/vim-tmux-navigator'
	use 'christoomey/vim-tmux-runner'
	use 'dracula/vim'
	use 'neoclide/coc.nvim'
	use 'scrooloose/syntastic'
	use 'itchyny/lightline.vim'
	use 'rayburgemeestre/phpfolding.vim'
	use 'majutsushi/tagbar'
	use 'mg979/vim-visual-multi'
	-- use 'ludovicchabant/vim-gutentags'
	use 'nvim-treesitter/nvim-treesitter'
	use 'vim-scripts/YankRing.vim'
	use { 
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim" ,
		},
	}
end)

