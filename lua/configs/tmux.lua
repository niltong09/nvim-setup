
vim.g.tmux_navigator_no_mappings = 0
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.opt.clipboard:append('unnamedplus')
vim.keymap.set('n','<C-h>', '<C-w>h')
vim.keymap.set('n','<C-j>', '<C-w>j')
vim.keymap.set('n','<C-k>', '<C-w>k')
vim.keymap.set('n','<C-l>', '<C-w>l')
-- vim.cmd [[ autocmd VimResized * :wincmd = ]]

-- vim.cmd([[

-- noremap <C-h> <C-w>h
-- noremap <C-j> <C-w>j
-- noremap <C-k> <C-w>k
-- noremap <C-l> <C-w>l
-- autocmd VimResized * :wincmd =

-- ]])
