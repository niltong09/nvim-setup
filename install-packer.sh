#!/usr/bin/env bash
#
# script that creates a file `install-coc-extensions.vim`
# Use this command to install it (coc.nvim plugin required):
#        vim -c 'source install-coc-extensions.vim'
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

