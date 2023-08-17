--vim.cmd([[ let g:ale_fixers = ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace'] ]])

--vim.cmd([[ let g:ale_fix_on_save = 1 ]])
--vim.cmd([[ let g:ale_completion_enabled = 1 ]])

--vim.cmd([[ execute pathogen#infect() ]])

vim.cmd([[ syntax on ]])
vim.cmd([[ filetype plugin indent on ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set ruler ]])
vim.cmd([[ set number ]])
vim.cmd([[ set tabstop=2 ]])

vim.cmd([[ set statusline+=%#warningmsg# ]])
vim.cmd([[ set statusline+=%{SyntasticStatuslineFlag()} ]])
vim.cmd([[ set statusline+=%* ]])

vim.cmd([[ let g:syntastic_always_populate_loc_list = 1 ]])
vim.cmd([[ let g:syntastic_auto_loc_list = 1 ]])
vim.cmd([[ let g:syntastic_check_on_open = 1 ]])
vim.cmd([[ let g:syntastic_check_on_wq = 0 ]])
vim.cmd([[ set wildignore+=*/tmp/*,*.so,*.swp,*.zip ]])
vim.cmd([[ let g:ctrlp_working_path_mode = 'rc' ]])
vim.cmd([[ let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules|tmp|logs|vendor|dist)$' ]])
vim.cmd([[ let mapleader = "," ]])
vim.cmd([[ nmap <leader>n :NERDTreeToggle<CR>]])
-- vim.cmd([[ nmap <leader>b :CtrlPMixed<CR>]])
-- vim.cmd([[ nmap <leader>j :CtrlP<CR>]])
vim.cmd([[ nmap <leader>w :w<CR> ]])
vim.cmd([[ nmap <leader>q :q<CR> ]])
vim.cmd([[ nmap <leader>tn :tabnew<CR> ]])
vim.cmd([[ nmap <leader>tl :tabn<CR> ]])
vim.cmd([[ nmap <leader>th :tabp<CR> ]])
-- vim.cmd([[ autocmd BufEnter * call ncm2#enable_for_buffer() ]])
vim.cmd([[ set completeopt=noinsert,menuone,noselect ]])
vim.cmd([[ let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log" ]])
vim.cmd([[ let $NVIM_PYTHON_LOG_LEVEL="/tmp/DEBUG" ]])
vim.cmd([[ set so=7 ]])
vim.cmd([[ colorscheme dracula ]])

vim.cmd([[
let g:tmux_navigator_no_mappings = 0
let g:tmux_navigator_disable_when_zoomed = 1

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
autocmd VimResized * :wincmd =

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
nmap <C-t>l :tabn<CR>
nmap <C-t>h :tabp<CR>

set clipboard+=unnamedplus

]])

--vim.cmd([[ source ~/.config/nvim/coc_config.vim ]]);

local builtin = require('telescope.builtin')
vim.keymap.set('n','<leader>j',builtin.find_files, {})
vim.keymap.set('n','<leader>fg',builtin.live_grep, {})
vim.keymap.set('n','<leader>fb',builtin.buffers, {})
vim.keymap.set('n','<leader>fh',builtin.help_tags, {})
vim.keymap.set('v','<leader>m',":VtrSendLinesToRunner<CR>", {})

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

