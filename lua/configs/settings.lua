--vim.cmd([[ let g:ale_fixers = ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'] ]])

--vim.cmd([[ let g:ale_fix_on_save = 1 ]])
--vim.cmd([[ let g:ale_completion_enabled = 1 ]])

--vim.cmd([[ execute pathogen#infect() ]])

vim.g.mapleader = " "
vim.cmd.syntax = "on"
vim.cmd.filetype = "plugin indent on"

-- vim.cmd([[ syntax on ]])
-- vim.cmd([[ filetype plugin indent on ]])
vim.opt.shiftwidth = 2
vim.opt.ruler = true
-- vim.opt.number = 2
vim.opt.tabstop = 2
vim.opt.wildignore:append("*/tmp/*,*.so,*.swp,*.zip")
vim.opt.completeopt = noinsert,menuone,noselect
vim.opt.so = 7
vim.cmd.colorscheme = dracula

-- vim.cmd([[ set shiftwidth=2 ]])
-- vim.cmd([[ set ruler ]])
vim.cmd([[ set number relativenumber ]])
-- vim.cmd([[ set tabstop=2 ]])

-- vim.cmd([[ set wildignore+=*/tmp/*,*.so,*.swp,*.zip ]])
vim.keymap.set('n','<leader>n',vim.cmd.NERDTreeToggle)
vim.keymap.set('n','<leader>w',vim.cmd.write)
vim.keymap.set('n','<leader>q',vim.cmd.quit)
vim.keymap.set('n','<leader>tn',vim.cmd.tabnew)
vim.keymap.set('n','<leader>tl',vim.cmd.tabn)
vim.keymap.set('n','<leader>th',vim.cmd.tabp)

-- vim.o.NVIM_PYTHON_LOG_FILE = "/tmp/nvim_log"
-- vim.o.NVIM_PYTHON_LOG_LEVEL = "DEBUG"
-- vim.cmd([[ set completeopt=noinsert,menuone,noselect ]])
-- vim.cmd([[ let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log" ]])
-- vim.cmd([[ let $NVIM_PYTHON_LOG_LEVEL="/tmp/DEBUG" ]])
-- vim.cmd([[ set so=7 ]])
-- vim.cmd([[ colorscheme dracula ]])

-- vim.cmd([[
-- let g:tmux_navigator_no_mappings = 0
-- let g:tmux_navigator_disable_when_zoomed = 1

-- noremap <C-h> <C-w>h
-- noremap <C-j> <C-w>j
-- noremap <C-k> <C-w>k
-- noremap <C-l> <C-w>l
-- autocmd VimResized * :wincmd =

-- nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
-- nnoremap <leader>= :wincmd =<cr>
-- nmap <C-t>l :tabn<CR>
-- nmap <C-t>h :tabp<CR>

-- set clipboard+=unnamedplus

-- ]])

--vim.cmd([[ source ~/.config/nvim/coc_config.vim ]]);

local builtin = require('telescope.builtin')
vim.keymap.set('n','<C-p>',builtin.git_files, {})
vim.keymap.set('n','<leader>j',builtin.find_files, {})
vim.keymap.set('n','<leader>fg',builtin.live_grep, {})
vim.keymap.set('n','<leader>fb',builtin.buffers, {})
vim.keymap.set('n','<leader>fh',builtin.help_tags, {})
vim.keymap.set('v','<leader>m',":VtrSendLinesToRunner<CR>", {})
vim.keymap.set('n','<leader>gg', ':LazyGit<CR>',{})

-- lualine config
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'dracula',
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics' },
		lualine_c = {
			{
				'filename', 
				path = 1
			}
		},
		lualine_x = {'encoding', 'fileformat', 'filetype' },
		lualine_y = {'progress'},
		lualine_z = {'location'},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { },
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {
		lualine_a = {},
		lualine_b = { },
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = { },
		lualine_c = {
			{
				'filename', 
				path = 1
			}
		},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {},
	}
}

local api = vim.api

local M = {}
function M.makeScratch()
	api.nvim_command('enew')
	vim.bo[0].buftype=nofile
	vim.bo[0].bufhidden=hide
	vim.bo[0].swapfile=false
end

function M.loadReactErrors()
	-- vim.o.errorformat="%-GERROR in ./%.%#,%EERROR in %f\\*,%Z  Line %l:%c: %m,%-G%.%#"
	vim.o.errorformat="%EERROR in %f:%l:%c,%Z"
	vim.cmd.cexpr("system('last_traceback .build-log.log')")
end
vim.keymap.set('n','<leader>!',M.loadReactErrors,{})

-- lazygit config
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = '' -- custom config file path
-- OR
vim.g.lazygit_config_file_path = {} -- table of custom config file paths


