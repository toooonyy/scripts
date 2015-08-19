set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Plugin 'davidhalter/jedi-vim'
Plugin 'Solarized'
Plugin 'darkerdesert'
Plugin 'Indent-Guides'
call vundle#end() 
filetype plugin indent on

syntax enable

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
set showmatch
set ruler 
set number
set hlsearch
set autoread
set encoding=utf8

set nobackup
set nowb
set noswapfile

set background=dark
colorscheme darkerdesert

let g:jedi#completions_command = "<C-N>"

autocmd BufNewFile *.py exec ":call SetTitle()"
func SetTitle() 
    if &filetype == "python"
        call setline(1,"#!/usr/bin/env python")
        call setline(2,"# -* - coding: UTF-8 -* -")
    endif
endfunc
